From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 26 Jun 2012 08:46:18 +0100
Subject: [Buildroot] [PATCH] lighttpd: use standard web root directory
In-Reply-To: <CAHt8ZCPugRu+3S8f5_8+u6g8t4xvYDX+r7yJuf85s1xMQgwthQ@mail.gmail.com>
References: <1340634705-20022-1-git-send-email-spdawson@gmail.com>
 <4FE92FB1.4080508@mind.be>
 <CAHt8ZCPugRu+3S8f5_8+u6g8t4xvYDX+r7yJuf85s1xMQgwthQ@mail.gmail.com>
Message-ID: <CAHt8ZCMy_NN4RGu7A0xd8mrqDkXYFtHKPboLmyW6+09sMFCBxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 June 2012 04:42, Arnout Vandecappelle <arnout@mind.be> wrote:
>> --accesslog.filename ? ? ? ? ?= log_root + "/access.log"
>> -+accesslog.filename ? ? ? ? ?= log_root + "/lighttpd-access.log"
>
> ?Why is this removed?

Having thought about this, it looks like it was probably done in case
some other package were to log to /var/log/access.log, which seems not
unlikely. But elsewhere in the patch, the log root directory is
changed from the default /var/log/lighttpd to /var/log; were this not
changed, the log file rename would be unnecessary.

My intention is to leave this as it is for now: any other tinkering
with the configuration should probably be done in a separate patch.
