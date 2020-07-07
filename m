From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 7 Jul 2020 07:01:02 -0500
Subject: [Buildroot] To stop a systemd service from starting by default
In-Reply-To: <BF61AD00-EF73-4CA4-89D4-2F9C21D9B185@gmail.com>
References: <BF61AD00-EF73-4CA4-89D4-2F9C21D9B185@gmail.com>
Message-ID: <CANQCQpbHc2FUtr7PM78gsS3O8N9oR5Tj2X4GU2uCnUh7SGi+1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Srijan,

On Sun, Jul 5, 2020 at 7:59 AM Srijan Nandi - Gmail
<srijan.nandi@gmail.com> wrote:
>
> Hello All,
>
> I am trying to stop certain systemd services from starting up by default. I have added the following lines in 80-buildroot.preset,
>
> disable dhcpcd.service
> disable nginx.service
> disable ntpd.service
> disable org.cups.cupsd.service
> disable org.cups.cups-lpd at .service
> disable postgresql.service
> disable redis.service
> disable rsyslog.service
> disable sshd.service
> disable strongswan.service
> disable suricata.service

I've CC'd Jeremy to see if he's ran into this use case.  I know you
can use post scripts to fixup the target symlinks to disable the
services but that doesn't seem like it is the cleanest method.

Jeremy, have you ran into this use case where it might make sense to
include a preset disable file?  Is it as easy as including it in the
overlay so that it gets picked up after the  80-buildroot.preset when
the symlinks for targets are offline generated?  Or would a new
buildroot option under systemd make sense to allow the user to point
at a set of preset files that get pulled into the build?

Regards,
Matt
