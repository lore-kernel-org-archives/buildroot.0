From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 27 Aug 2012 21:52:51 +0200
Subject: [Buildroot] dropbear permission denied
In-Reply-To: <20120824193105.13f01c2e@skate>
References: <8E7CEF5A14A94EDF90F261B9ED2FC9E6@meiernt.local>
 <3C32AECB8207924A9A228348325DB2D29050F1@mntserv.meier-nt.local>
 <20120824135323.654eb15b@skate>
 <CAAfyv37CS+Hss_-kfiv9tGZDTPpeiG-bzjyF5mqNdL61=PNupg@mail.gmail.com>
 <20120824193105.13f01c2e@skate>
Message-ID: <CAAfyv35YiKATy5Uz2qvPUqDUfV1nFfeARRHY55aUPcJ_ZT67Hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 24, 2012 at 7:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Fri, 24 Aug 2012 16:31:38 +0200,
> Belisko Marek <marek.belisko@gmail.com> a ?crit :
>
>> > Correct. dropbear doesn't allow login into accounts that have an
>> > empty password.
>> Is there any way in e.g. post-processing to set some passwd (maybe
>> empty) for root user to avoid such troubles? Anybody using it that
>> way?
>
> See http://www.elinux.org/images/2/2a/Using-buildroot-real-project.pdf
> slide 25. You can use the post-build script mechanism to tune
> the /etc/passwd file to set a root password.
Thanks for link.
>
> I once thought of adding a Kconfig option for that, but it would mean
> that the root password would be stored as clear text in the .config
> file, which probably isn't that nice.
>
> Should we make the default 'root' password be 'root' so that it is
> non-empty and it works with Dropbear? Or simply add a FAQ entry
> which explains this problem? Other ideas?
As I read http://www.elinux.org/images/2/2a/Using-buildroot-real-project.pdf
it's really easy to do it in post-build script. IMO adding to FAQ with
simple example
could solve dropbear problems.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Cheers,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
