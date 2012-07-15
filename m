From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Sun, 15 Jul 2012 13:27:31 -0400
Subject: [Buildroot] Systemd update
In-Reply-To: <CALR4fEKHpNy-TyCBWigS-9gLySp_d3Amy_N=xZqSWbif-9H97A@mail.gmail.com>
References: <CADiAo4KdxANfaB4xZyWBZe_w+y-p9UTJ1FVjcX7=KgRHkinVHQ@mail.gmail.com>
 <CALR4fEKHpNy-TyCBWigS-9gLySp_d3Amy_N=xZqSWbif-9H97A@mail.gmail.com>
Message-ID: <CADiAo4K8uDUatAYeVvppkEhs1bxEqCg-rcsHLOFhcMEEwxPjEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Jul 15, 2012 at 10:19 AM, Diego Iastrubni <diegoiast@gmail.com> wrote:
> How does it compare with a similar setup, using "normal" logins and
> busybox's init?

It may be a bit more complicated than "traditional" sequential setup,
but infinitely more flexible. I needed such a parallel dependency
driven init program and thought of porting Android's setup, but
systemd is the same but on big steroids.

>
> How much time does it take to boot under both setups?

I do not remember how much it took under traditional setup. I get 24
sec by kernel timestamp until the moment I can login, but this also
involves setting up DHCP (since my setting is diskless) on a KVM
running on a 2 GHz AMD64. Plus it takes some time to unpack the initrd
image (mune is about 40M) So I'd discount 5 to 10 seconds for "pure
boot time"

I'll try to boot my test image later and give better measurements then.

> How much memory does it take to login a single user?

I am not sure how to measure this. Besides, in my case initrd unpacks
into memory anyway so it alone eats tens of megs.

>
>  - I know this is only for your setup, but it might give us real numbers.
>
> BTW: is PAM mandatory?

No it is not. It is the login program that lets the user in. What
systemd-pam does is to notify the session manager of new session (so
it can watch it and clean up afterwards), and set up a cgroup for the
new session. If you do not include systemd-pam in the PAM stack (or do
not use PAM at all) systemd starts getty and you can login normal way.
Again, it is just something I need for my project.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
