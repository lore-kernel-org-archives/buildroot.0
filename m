From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 11 May 2015 22:17:26 -0500
Subject: [Buildroot] [PATCH 1/1] bash: added option to disable locale
	support
In-Reply-To: <87zj7kock8.fsf@dell.be.48ers.dk>
References: <1425935595-46330-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20150309224257.2c985fbf@free-electrons.com>
 <CANQCQpbKmA6of1MQrBB1WY16rfApDYaA6J0uK8PEtHmxn96inA@mail.gmail.com>
 <87zj7kock8.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpb+2iguEy6dWpj3FAScQdXFxC7HLqep5aWLhkUDeLeFGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Mar 10, 2015 at 2:52 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>
>  > Thomas, all.
>  > On Mon, Mar 9, 2015 at 4:42 PM, Thomas Petazzoni
>  > <thomas.petazzoni@free-electrons.com> wrote:
>  >> Dear Matt Weber,
>  >>
>  >> On Mon,  9 Mar 2015 16:13:15 -0500, Matt Weber wrote:
>  >>
>  >>> +if BR2_PACKAGE_BASH
>  >>> +
>  >>> +config BR2_PACKAGE_BASH_NO_LOCALE
>  >>> +     bool "disable locale support"
>  >>> +     help
>  >>> +       Disable locale support for cases where toolchain has it
>  >>> +       but target isn't setup to use it.
>  >>> +
>  >>> +endif
>  >>
>  >> To be honest, I'm not sure we want to support such cases. What does it
>  >> mean for the target to not be setup to use locales?
>
>  > I should probably clarify, this disabled the runtime check of locale
>  > that bash did everytime a shell was invoked.  All packages where still
>  > built with locale support.  Busybox ash didn't perform this check so
>  > we never noticed it until we switched to bash.  (I believe, will have
>  > to double check)Bash is running  setlocale after checking for a env
>  > variable LC_xxxxx before the shell starts.  Currently we don't have
>  > our env setup to by default have LC_xxxxx set.  Instead we  set the
>  > LC_xxxxx as part of the service/app start rcS script. (There maybe
>  > better way's of handling this I'm sure).
>
> So what is the impact exactly of having/not having this option?

I'd like to drop this patch at this point.  I think I figured out what
was happening and resolved it through additional busybox options being
enabled.  Pending more testing I might submit a follow on if it is
really required.  Should I transition it to rejected and archive it?

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
