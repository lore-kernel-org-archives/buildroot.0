From: Andreas Ziegler <br015@umbiko.net>
Date: Mon, 24 Feb 2020 14:22:04 +0100
Subject: [Buildroot] SSH server starts too late
In-Reply-To: <CAGSpp9ng2yxCK=RZeq1Z_Bce4pwij9FQED23SpGuvjqm5awHhg@mail.gmail.com>
References: <mailman.11.1582286403.41897.buildroot@busybox.net>
 <33327ed4301c921b1ded444b5b7c3b89@umbiko.net>
 <CAGSpp9=Ji6HASueKR3m_LbFAm6vR6Lb_2SvAsFHsGY9qmmDyZA@mail.gmail.com>
 <1d91f38acaeecb790f5a44d104ae0ca1@umbiko.net>
 <CAGSpp9ng2yxCK=RZeq1Z_Bce4pwij9FQED23SpGuvjqm5awHhg@mail.gmail.com>
Message-ID: <ab1578656655630d72babe9984a136b8@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-02-24 13:33, Hammami Omar wrote:

Hi Omar,

> The problem is that, in kernel logs, I cannot see that my ssh server
> was blocked.
> That is why, I am thinking if my problem is really du to entropy or
> no.

You should experience a time lag in kernel log time stamps when that 
happens. If this lag is caused by an entropy issue, starting to type 
randomly on the keyboard should resolve it quite fast. This will speed 
up the time until you see the final random output:

> [   77.847665] random: nonblocking pool is initialized

The SSH server will definitely not be operative until this pool is 
initialized.

Kind regards,
Andreas
