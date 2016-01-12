From: Julien CORJON <corjon.j@ecagroup.com>
Date: Tue, 12 Jan 2016 11:50:53 +0000
Subject: [Buildroot] [PATCH 1/2] qt/qt5base: force gstreamer on configure
In-Reply-To: <20160110161902.GF3460@free.fr>
References: <1438855575-4767-1-git-send-email-corjon.j@ecagroup.com>
 <20160110161902.GF3460@free.fr>
Message-ID: <5694E89C.30807@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Peter, All

Le 10/01/2016 17:19, Yann E. MORIN a ?crit :
> Julien, All,
>
> On 2015-08-06 12:06 +0200, Julien Corjon spake thusly:
>> Fixes: http://autobuild.buildroot.net/results/0ee0f879e8563954c64b3940cdec39d2e6de937a/
>
> As Thomas said, this does not really fix that issue.
>
> However, still following Thomas comment, I think this is a valid patch,

Patch was valid back then.

> and it should be applied with a tweaked commit log;
>
>      package/qt5base: add support for optional gstreamer
>
>      qt5base can optionally support gstreamer-0.10 or gstreamer-1.0.
>      Upstreamer still considers gstreamer-0.10 to be preferred over 1.0.
>
>      Ensure that gstreamer, when enabled, is built before qt5base; tell
>      qt5base to use the proper gstreamer variant, or none if gstreamer
>      is not enabled.
>
>      Signed-off-by: You
>

Peter already patch gstreamer for qt5base and he have removed 
gstreamer0.1 support[1]. I'm not sure this was the good solution because 
gstreamer0.1 is still the default choise for Qt[2] but no buildroot user 
seems to complain about that.

> With that fixed, you can add my:
>
>      Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.

Regards,
Julien Corjon

[1] 
https://git.busybox.net/buildroot/commit/?id=da9f034d5d1df10ad6c3e249a9a488dc7ef1c42a
[2] https://wiki.qt.io/New_Features_in_Qt_5.5
