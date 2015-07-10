From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 00:28:57 +0200
Subject: [Buildroot] [PATCH v3 1/2] libfcgi
 (0003-link-against-math.patch): Do actually link when needed.
In-Reply-To: <1432916111-1122-1-git-send-email-thomas.claveirole@green-communications.fr>
References: <55679467.7090801@mind.be>
 <1432916111-1122-1-git-send-email-thomas.claveirole@green-communications.fr>
Message-ID: <20150711002857.0098e0d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Claveirole,

On Fri, 29 May 2015 18:15:10 +0200, Thomas Claveirole wrote:
> libfcgi uses frexp() and thus should link with libm, but fails to do
> so.  Thus link errors with programs that use libfcgi (the bug does
> appear only with uClibc, because the GNU libc provides frexp()
> directly in libc.so).  Modify 0003-link-against-math.patch so libfcgi
> links against math, instead of programs that need it.
> 
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/libfcgi/0003-link-against-math.patch | 36 ++++++++++------------------
>  1 file changed, 12 insertions(+), 24 deletions(-)

Applied with a slightly edited commit title, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
