From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 23:00:25 +0200
Subject: [Buildroot] [PATCH 01/28] Makefile.package.in: Makes it
	possible to override the default extract commands
In-Reply-To: <6a958f27db3dcd17eb43afaf7444ffe962bfa3ef.1309895466.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 Jul 2011 21:53:52 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <6a958f27db3dcd17eb43afaf7444ffe962bfa3ef.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87aacprel2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Allan W. Nielsen <a@awn.dk>
 Thomas> When using GENTARGETS (or macroes depending on it), there is no way of
 Thomas> specifying a custom extraction procedure. When using the patch one can
 Thomas> simply define $(PACKAGE_NAME)_EXTRACT_CMDS which will override the
 Thomas> default. If non is defined it will fall back to the default extract
 Thomas> procedure.

 Thomas> An example could look like this:

 Thomas> === PACKAGE BEGIN ===
 Thomas> FGLRX_VERSION=11-3
 Thomas> FGLRX_SOURCE:=ati-driver-installer-$(FGLRX_VERSION)-x86.x86_64.run
 Thomas> FGLRX_SITE:=http://www2.ati.com/drivers/linux/

 Thomas> define FGLRX_EXTRACT_CMDS
 Thomas> 	sh $(DL_DIR)/$(FGLRX_SOURCE) --extract $(@D)
 Thomas> endef

Committed, thanks.

It would be good to document this in buildroot.html as well.

-- 
Bye, Peter Korsgaard
