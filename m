From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 26 Jun 2012 08:38:55 +0100
Subject: [Buildroot] [PATCH] lighttpd: use standard web root directory
In-Reply-To: <4FE92FB1.4080508@mind.be>
References: <1340634705-20022-1-git-send-email-spdawson@gmail.com>
 <4FE92FB1.4080508@mind.be>
Message-ID: <CAHt8ZCPugRu+3S8f5_8+u6g8t4xvYDX+r7yJuf85s1xMQgwthQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the comments Arnout.

On 26 June 2012 04:42, Arnout Vandecappelle <arnout@mind.be> wrote:
>> --accesslog.filename ? ? ? ? ?= log_root + "/access.log"
>> -+accesslog.filename ? ? ? ? ?= log_root + "/lighttpd-access.log"
>
> ?Why is this removed?

This was part of the original lighttpd "fix config file" patch, so I
can't say what the motivation was. It certainly looks to be
unnecessary.

> ?This seems to imply that the actual server root (i.e. what http://hostname/
> is pointing to) is /var/www/htdocs, not /var/www. ?So that's still different
> from the other packages.

Well spotted; I'll fix my patch and resubmit.
