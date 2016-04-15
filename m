From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 15 Apr 2016 17:16:48 -0300
Subject: [Buildroot] [PATCH v2 4/4] board/minnowboard-max: Add a X-based
 graphical defconfig
In-Reply-To: <20160415221418.0040673d@free-electrons.com>
References: <1460735767-2577-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460735767-2577-5-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160415220107.585d1fb2@free-electrons.com>
 <CAAEAJfAgt5e6QK2aKLiit-upNmi1AWmcOUz5qDtqQU+EYMf0nA@mail.gmail.com>
 <20160415221418.0040673d@free-electrons.com>
Message-ID: <CAAEAJfDxiw_2+Zh7GStaqkvtSNm=wOAZWT7-W8ZmdmfSRmNs4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 April 2016 at 17:14, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 15 Apr 2016 17:11:56 -0300, Ezequiel Garcia wrote:
>
>> Nope, it's the standard startx script, provided by the xinit package.
>
> The big question now is why do you have this script in an overlay
> rather than using the one provided by the xinit package?
>

Quoting the script itself:

+# Fixup startx so it doesn't start X on the controlling
+# virtual console. Apparently, this is a bug and we are
+# affected for our lack of a Display Manager.
+# See https://bugs.freedesktop.org/show_bug.cgi?id=87762
+#
+# I haven't found a way to do this without hacking startx
+# itself. The only change we are doing here is setting
+# serverargs to "vt1", see below.

Unless serverargs is set, calling "startx" without params
will always use the controlling terminal, and X then
fails to switch VT or something. Don't really recall
the error, but it prevented X from starting.

-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
