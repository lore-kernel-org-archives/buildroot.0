From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Oct 2019 20:46:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfont2: fix
 libbsd detection
In-Reply-To: <20191019074826.16026-1-bernd.kuhls@t-online.de>
References: <20191019074826.16026-1-bernd.kuhls@t-online.de>
Message-ID: <ef53b723-6522-1803-e5a3-163a581abb91@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/10/2019 09:48, Bernd Kuhls wrote:
> Previous patch defined HAVE_LIBBSD even if strlcat function was present
> in libc leading to build errors due to inclusion of bsd/string.h:
> https://gitlab.freedesktop.org/xorg/lib/libxfont/blob/master/src/util/replace.h#L50
> 
> AC_SEARCH_LIBS is defined as
> "Search for a library defining function if it's not already available."
> https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Libraries.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Why didn't you have a Fixes: tag?

 Regards,
 Arnout
