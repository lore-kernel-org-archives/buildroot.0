From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 10:51:22 +0200
Subject: [Buildroot] [RFC v2 0/5] common service startup files
In-Reply-To: <cover.1428263859.git.alex.suykov@gmail.com>
References: <cover.1428263859.git.alex.suykov@gmail.com>
Message-ID: <20150406105122.4b13f5b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Mon, 6 Apr 2015 01:01:19 +0300, Alex Suykov wrote:
> This series is intended to simplify and clean up installation routine
> for daemon-like applications, merging sysv and systemd startup files
> and moving much of the common code out of per-package .mk files.

Thanks a lot for working on this.

To be honest, my feeling is that I don't really like Buildroot to
invent its own "abstract" language to describe the initialization of
services, then used to generate SysV and Systemd unit files.

There are two main reasons for this feeling.

First of all, because the philosophy of Buildroot is to not invent new
language, or add layers on top of what exists: we use Kconfig for the
configuration, make for the package building logic, shell and Python
scripts in some situations. This is all standard, and generally well
known by most Linux developers. Even though the language you propose
for describing the initialization of services is certainly not very
complicated, it remains a layer on top of what really happens.

Second, such abstract languages usually appear simple initially. But
then, some corner cases show up, with cases that can easily be solved
in shell scripts or systemd unit files, but were not planned in this
small abstract language. So it has to be extended. Again, and again. To
finally become as complicated as the shell scripts or systemd unit
files.

Of course, my opinion is just one amongst many other Buildroot
developers, and if all other Buildroot developers are convinced that
this is the way to go, then we'll do it. But since not many people
gave their opinion about this, I thought I would simply give mine.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
