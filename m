From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 6 Nov 2018 22:21:52 -0200 (BRST)
Subject: [Buildroot] [PATCH v4 1/4] busybox: rewrite logging init script
In-Reply-To: <CANQCQpbwfJLYkXZhp6jK4TGFT87PTZe7haPof-WQsjpFckxe=Q@mail.gmail.com>
References: <20181103182427.11738-1-casantos@datacom.com.br>
 <20181103182427.11738-2-casantos@datacom.com.br>
 <CANQCQpbwfJLYkXZhp6jK4TGFT87PTZe7haPof-WQsjpFckxe=Q@mail.gmail.com>
Message-ID: <1914783789.535455.1541550112249.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Matthew Weber" <matthew.weber@rockwellcollins.com>
> To: "DATACOM" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "ratbert90" <aduskett@gmail.com>, "Chris Packham" <judge.packham@gmail.com>
> Sent: Segunda-feira, 5 de novembro de 2018 11:57:03
> Subject: Re: [PATCH v4 1/4] busybox: rewrite logging init script

> Carlos,
[...]
> 
> I can see this naming change will cause a number of people to end up
> debugging their targets as a custom S01logging will be copied over and
> then the installs of the new files with different names below.  Is
> there any thoughts on making this a visible or obvious change so users
> don't get caught up?

I can't imagine a mechanism do this but I'm open to suggestions. It's hard
to foresee all changes that users make on the default build by means of
custom rootfs skeletons, private packages, post-{build,image} scripts and
so on.

Of course the change deserves to be mentioned in the release notes.

[...]

>> +# BusyBox' syslogd and klogd do not create pidfiles, so use "-m" to instruct
>> +# start-stop-daemon to create them. This also means that we must pass "-n" to
>> +# sylogd and klogd in the command line.
> 
> sylogd -> syslogd
> 
> Since this script only handles syslogd now, assuming maybe the text
> should only reference that daemon? (nit)

Yes. Thanks.

> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
