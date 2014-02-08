From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 07 Feb 2014 21:00:08 -0300
Subject: [Buildroot] [PATCH 4/4] samba4: new package
In-Reply-To: <CAHXCMM+20-NKLye=6rhg1p2toLjSsY-KkOWu+fQTUVucwJ8UPw@mail.gmail.com>
References: <1391806354-32698-1-git-send-email-gustavo@zacarias.com.ar>
 <1391806354-32698-5-git-send-email-gustavo@zacarias.com.ar>
 <CAHXCMM+20-NKLye=6rhg1p2toLjSsY-KkOWu+fQTUVucwJ8UPw@mail.gmail.com>
Message-ID: <52F57388.3040105@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/07/2014 07:29 PM, Samuel Martin wrote:

Hi Samuel.

> Indentation is weird here, no?

D'oh, happened when juggling things around to make them look good in the
menu itself. I'll fix it for V2.

> Does not samba4 depend on !BR2_PREFER_STATIC_LIB too?
> Last time I try to build/link statically a waf project (libtalloc
> which is under the
> samba umbrella IIRC), it was impossible because of waf build-system. :-/

Frankly, i don't know, the build fails before in some of the deps
(e2fsprogs like
http://autobuild.buildroot.net/results/284/284f2a161d110d4c561cf89c052ce531b4edc173/build-end.log)
libtalloc can be split out of samba, it's a separate project that both
samba3 & 4 can use.
There are other bits that could be split out as well such as tdb and
tevent, but since both samba versions can't live side by side and there
aren't any other packages that use them it's not very useful at the moment.
Regards.
