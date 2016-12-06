From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 6 Dec 2016 09:20:07 +0200
Subject: [Buildroot] [PATCH 1/1] tftpd: make installation of tftp client
 optional
In-Reply-To: <6A3F8AF4AF06764EBB67BDF72AE0FB4701F8EA38FE@ly-ex-02.thrane.tt.ad>
References: <6A3F8AF4AF06764EBB67BDF72AE0FB4701F8E8F554@ly-ex-02.thrane.tt.ad>
 <20161205222952.1ae0c4ea@free-electrons.com>
 <6A3F8AF4AF06764EBB67BDF72AE0FB4701F8EA38FE@ly-ex-02.thrane.tt.ad>
Message-ID: <20161206072007.57ieumcxgx4r6aiw@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Tue, Dec 06, 2016 at 07:07:36AM +0000, Nielsen, David Marqvar wrote:
> > Your commit log is empty, so I'm not sure what you're trying to do
> > here. If I understand correctly, you want a sub-option to
> > enable/disable the installation of the "tftp" binary, so that you can
> > have a configuration where:
> > - tftpd is the one coming from the tftpd package
> > - tftp remains the one provided by Busybox
> 
> Exactly.
> The (rather unusual) situation is that the Busybox implementation has
> features that the "full" tftpd package does not support - features that
> we have come to rely on (set block size).

The atftp TFTP client seems to support block size set:

  --option "blksize 1428"

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
