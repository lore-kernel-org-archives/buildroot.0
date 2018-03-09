From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 9 Mar 2018 09:10:46 -0800
Subject: [Buildroot] [PATCH] package: dropbear: make PATH configurable
In-Reply-To: <CALURroToOdxgb1bpT3d50j4POkmh+BkLGOWHQF_fqh0gCuzo-w@mail.gmail.com>
References: <20180308214403.94906-1-mmayer@broadcom.com>
 <20180308214801.GA8180@scaer>
 <CAGt4E5s10L9SxMzSR8-CSu1Q23woZGKHuyHgJM4EENWKR7TTqQ@mail.gmail.com>
 <CALURroToOdxgb1bpT3d50j4POkmh+BkLGOWHQF_fqh0gCuzo-w@mail.gmail.com>
Message-ID: <CALURroR3pvrWv_gtkqBMtE8OgSwUUbC9tBrfUbiiMf8=tcJmTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 8, 2018 at 4:34 PM, Christopher McCrory <chrismcc@gmail.com>
wrote:

<snip>



>
> $ ssh brcmstb
> # echo $PATH
> /bin:/usr/bin:/sbin:/usr/sbin
>
>
>
>
> ssh -t $host echo $PATH
>
>
I thought that would work (forcing a term), but it doesn't


This will do what you want on your local project

$ cat output/local.mk
DROPBEAR_CONF_OPTS += --enable-foo=bar

define DROPBEAR_CUSTOM_PATH
$(SED) 's|^\(#define DEFAULT_PATH\).*|\1
"/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"|'
$(@D)/options.h
endef

DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_CUSTOM_PATH






-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180309/4ec865f7/attachment.html>
