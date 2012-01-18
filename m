From: Arkady Gilinsky <arcadyg@gmail.com>
Date: Wed, 18 Jan 2012 08:37:30 +0200
Subject: [Buildroot] [PATCH v2] bash: Adding features that can not be
 automatically detected while cross-compiling
In-Reply-To: <87wr8qnd1c.fsf@macbook.be.48ers.dk>
References: <1326820937-28384-1-git-send-email-arnout@mind.be>
 <1326821128-29133-1-git-send-email-arnout@mind.be>
 <87wr8qnd1c.fsf@macbook.be.48ers.dk>
Message-ID: <CA+gTGJFtJVTOeS8su7P2FnP4OMLFhbpvg6JMAymkL2uLs5+ogQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 18, 2012 at 1:07 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
>
> ?Arnout> From: Arkady Gilinsky <arcadyg@gmail.com>
>
> ?Arnout> There are some bash features that can not be detected
> ?Arnout> automatically during configure stage while
> ?Arnout> cross-compiling. This commit adds the ability to force support
> ?Arnout> of such features.
>
> Ok, but does it make sense to make these things configurable? I haven't
> checked, but presumably these are supported on all Linux archs, and
> don't affect the binary size significantly (compared to bash size)?
>
> Couldn't we just always forcibly enable these instead?

I agree with you, Peter, that these features supported on many/almost
all Linux archs, but
current version of bash configuration in Buildroot has 'job_control'
feature set to off.
I didn't find the reason why (may be you know), so I decided to leave
the ability to set it off
for anybody who do not want/able to set this feature on.
Also the default setting is off to not to break any existing build.
If you find that these features should be forced set to on, inform me
I will make an appropriate patch.



-- 
Best regards
Arkady Gilinsky
