From: Brian Foster <brian.foster@maximintegrated.com>
Date: Thu, 2 Jun 2016 17:51:32 +0200
Subject: [Buildroot] [BUG 2016.05] uClibc-ng argp-standalone War
Message-ID: <1902632.QltqilAAjO@laclwks004>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


 In 2016.05 there is a war between uClibc-ng and argp-standalone
 (quoting from our bugs database):

   ? If uClibc-ng v1.0.14 does not have argp support enabled,
    then it removes any installed <argp.h> header file.  Hence,
    if the BuildRoot 2016.05 package argp-standalone is enabled,
    a subsequent re-build of uClibc will remove argp-standalone's
    installed <argp.h> header, which can (later) cause very puzzling
    build failures. ?

  An example of a package which (forces, I think) the use of
  argp-standalone is the rng-tools (but is not the only one!).
  At the present time, I do not know if uClibc-ng's argp can
  be used, or what the issue is(? was?) the uClibc(-ng?) argp.

cheers!
	-blf-

-- 
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/
