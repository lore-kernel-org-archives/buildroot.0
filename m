From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Jun 2016 23:16:58 +0200
Subject: [Buildroot] [PATCH 7/7] fs/squashfs: remove useless chmod
In-Reply-To: <20160606230615.2772541c@free-electrons.com>
References: <cover.1465245732.git.yann.morin.1998@free.fr>
 <d4b5c7f0315f28e792a014983c78b1fe4958eb9f.1465245732.git.yann.morin.1998@free.fr>
 <20160606230615.2772541c@free-electrons.com>
Message-ID: <20160606211658.GA3706@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-06-06 23:06 +0200, Thomas Petazzoni spake thusly:
> On Mon,  6 Jun 2016 22:43:44 +0200, Yann E. MORIN wrote:
> > When that was added (in 975e30b, fs/squashfs: fix image file
> 
> There is no such commit as 975e30b:

Right, the leading '3' got lost in a bad copy-paste...

    $ git show --no-patch 3975e30b
    commit 3975e30b991d42d4cc153b738742f962d8fda757
    Author: Peter Korsgaard <jacmet@sunsite.dk>
    Date:   Tue Aug 31 21:53:40 2010 +0200

        fs/squashfs: fix image file permissions
    
        Set image file permissions to 0644 like it was before the fs rework,
        instead of the rather unhelpful 0700 (E.G. when image is used for tftp).
    
        Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

As already noticed by Peter.

> ~/projets/buildroot (master)$ git show 975e30b
> fatal: ambiguous argument '975e30b': unknown revision or path not in
> the working tree. Use '--' to separate paths from revisions, like this:
> 'git <command> [<revision>...] -- [<file>...]'
> 
> > permissions), the reasons were not quite explicit.
> 
> I very well remember that mksquashfs had the very annoying default
> behavior of making its output file 0444. Like because it was a
> read-only filesystem, the images should also be read-only, which is
> obviously a bit silly.

OK, that's good to know.

> Maybe mksquashfs has changed its default behavior since then, but
> clearly that's the reason why we were doing this.

At least, that's not what I can see here...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
