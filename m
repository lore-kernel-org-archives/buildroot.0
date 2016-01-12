From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jan 2016 21:20:45 +0100
Subject: [Buildroot] [PATCH] procps-ng: remove the remaining busybox
 symlinks
In-Reply-To: <20160112211220.2b7c24bb@free-electrons.com>
References: <1452608581-9742-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160112211220.2b7c24bb@free-electrons.com>
Message-ID: <20160112202045.GA3463@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Vicente, All,

On 2016-01-12 21:12 +0100, Thomas Petazzoni spake thusly:
> On Tue, 12 Jan 2016 14:23:01 +0000, Vicente Olivert Riera wrote:
> > procps-ng is installed after busybox to ensure that its tools overwrite
> > the ones installed by busybox. However, some busybox symlinks for tools
> > which are now provided by procps-ng remain in /bin and /sbin pointing to
> > the busybox binary.
> > 
> > This shouldn't be a problem since the /usr/bin directory is listed
> > before /bin in the $PATH variable. However there could be some scripts
> > out there hardcoding the path of those tools calling them by "/bin/ps"
> > for instance.
> > 
> > So in order to avoid potential problems we just remove all busybox
> > symlinks for the tools which are now provided by procps-ng.
> > 
> > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[--SNIP--]
> I don't think we're doing it this way for any other package. In
> general, we either:
> 
>  * Arrange for the package to install its tools at the same location as
>    Busybox installs them.
> 
>  * Or add a post-install hook to move the binaries installed by the
>    package to where Busybox installs them.
> 
> Peter, Yann ?

Yes, I agree with Thomas. First solution is preferred if possible, of
course, so that we don't have to maintain the list of executables to
move in the post-install hook.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
