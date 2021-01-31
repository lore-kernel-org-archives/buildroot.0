From: Joachim Wiberg <troglobit@gmail.com>
Date: Sun, 31 Jan 2021 23:58:26 +0100
Subject: [Buildroot] [RFC PATCH 0/1] package/sysklogd: proposal to
 update default syslog.conf
In-Reply-To: <20210131231346.6bce24e3@windsurf.home>
References: <20210130135203.159451-1-troglobit@gmail.com>
 <20210131231346.6bce24e3@windsurf.home>
Message-ID: <87sg6gg1d9.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 31, 2021 at 23:13, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> On Sat, 30 Jan 2021 14:52:02 +0100 Joachim Wiberg <troglobit@gmail.com> wrote:
>> The updated file changes the default log file from messages to syslog,
>> as is common on most modern systems today.  The messages remains but
>> only for less critical messages.  The update also adds more examples
>> for how to enable remote logging as well as different new log formats.
> Well, if the syslog.conf that we have in package/sysklogd/ is exactly
> the one contained in the sysklogd sources, then what is the point of
> having a copy in package/sysklogd/ ? We could just as well install the
> configuration file provided by upstream.

True, no point in having a local copy.

My main question was if there was any specific reason to sticking with
the old habits of only using /var/log/messages, as BusyBox syslogd does,
or if every logging package is free to have its own defalts?  Within
reason, of course.  I'm just a bit concerned with breaking peoples
defaults, even though they can just provide their own.

If it's OK to change for sysklogd, I can post a new patch that drops
the locallay maintained .conf and instead installs the sysklogd one.

Best regards
 /Joachim
