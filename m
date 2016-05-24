From: Brian Foster <brian.foster@maximintegrated.com>
Date: Tue, 24 May 2016 17:16:32 +0200
Subject: [Buildroot] [DOC BUG] Misleading password hash algorithm
Message-ID: <1828734.H60eMAyuYm@laclwks004>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  In ?23, ?Makeusers syntax documentation?, currently on the website,
  https://buildroot.org/downloads/manual/manual.html#makeuser-syntax
  it claims (in multiple places) that a plaintext <password> is hashed
  using MD5.  However, in at least the current source (2016.05-rc2),
  as I read the `support/scripts/mkusers' script, the cryptographic
  hash used is that configured by `BR2_TARGET_GENERIC_PASSWD_METHOD',
  which clearly makes more sense and can be, as one example, SHA-256.

cheers!
	-blf-

-- 
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/
