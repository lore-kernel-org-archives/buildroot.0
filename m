From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jun 2017 23:58:03 +0200
Subject: [Buildroot] [PATCH 3/3] docs/manual: document hashes for
 license files
In-Reply-To: <594c7ce55f5d1_3d94f10284367f8@ultri3.mail>
References: <41013c99543173da1ec547219c7f67e52d323a40.1497772831.git.yann.morin.1998@free.fr>
 <594c7ce55f5d1_3d94f10284367f8@ultri3.mail>
Message-ID: <20170625215803.GI3673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-06-22 23:28 -0300, Ricardo Martincoski spake thusly:
> On Sun, Jun 18, 2017 at 05:01 AM, Yann E. MORIN wrote:
> > +# Hash for license files:
> > +sha1  c47a888f2be626e1197b6f651dee966ef882077d  COPYING
> > +sha1  e101765734390d664b59325b2d644d80d9a6bd9a  doc/COPYING.LGPL
> 
> This will need a small change in check-package to not generate false warnings
> like this: "use filename without directory component".
> See HashFilename in checkpackagelib/lib_hash.py
> 
> 'make package-dirclean package-source' already generates 'ERROR: No hash found'
> if someone mistakenly adds a directory, for example dl/, to the name of the
> tarball in the hash file, so we are safe to just remove the entire HashFilename
> class.

Indeed, good catch!

Will fix for the next iteration.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
