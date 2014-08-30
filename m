From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 30 Aug 2014 20:33:26 +0200
Subject: [Buildroot] [PATCH 4/5] package/libplist: fix static link
In-Reply-To: <1409392347-16392-4-git-send-email-s.martin49@gmail.com>
References: <1409392347-16392-1-git-send-email-s.martin49@gmail.com>
 <1409392347-16392-4-git-send-email-s.martin49@gmail.com>
Message-ID: <CAHXCMMK6JsCD=N+XjajikchnjWXyYbB9p90g=9_9Y-oSqY5Mzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Aug 30, 2014 at 11:52 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> - libplist depends on libm and zlib (via libxml2), so add a patch fixing
>   the build-system that way

Nack!

Because libxml2 only depends on zlib if BR2_PACKAGE_ZLIB=y.(the same
with libiconv).
So this patch fix some failure and will create new ones :-(

I'll repost a fix as soon as I've figured out how to handle this.


-- 
Samuel
