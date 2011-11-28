From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Mon, 28 Nov 2011 10:14:58 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <20111128165422.49361aed@skate>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111122230429.2bef52c2@skate>
 <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
 <20111122232914.76a86e7d@skate>
 <006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVFSZpPxtsu9DmiEtw9LjNtdEWGQ+zdBQhscRAZ67vu_Q@mail.gmail.com>
 <001001ccaa28$4b7515c0$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVDR+9KnTJP36-hugA51QTikDsQ2ESO4c3C9-L8UJgqBA@mail.gmail.com>
 <001e01ccaddf$81c0f300$0400a8c0@dspcgrnzks9p98>
 <20111128161124.0f95d0d4@skate>
 <001f01ccade1$204918d0$0400a8c0@dspcgrnzks9p98>
 <20111128165422.49361aed@skate>
Message-ID: <002001ccade8$e03e9f00$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Woops, you're right, my bad. The manual is obvisouly correct.
> 
> You should use :
>
> ETHERCAT_VERSION = 3.3
> ETHERCAT_SITE = http://foobar.com/somewhere/
> ETHERCAT_SOURCE = ethercat-$(ETHERCAT_VERSION).tar.bz2
> 
> Why are you using a local directory ? You *really* should be using a
> tarball available from http or ftp so that you can later contribute
> your package to Buildroot.

Because I don't want just the default source of EtherCAT built into the
Linux image.  Lets say I want to modify something in the examples directory
of EtherCAT.  For instance, I had to modify the sample code and rebuild.  So
what I want is this "rebuilt" version of EtherCAT, with customized example
code, as part of the Linux image.  If I point at the EtherCAT website, that
won't be the correct version.  The EtherCAT examples development will occur
on the same machine that Buildroot is on, hence why I like the local
filesystem solution.

So any thoughts on why it is not finding the file?

Thanks.
