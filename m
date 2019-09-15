From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Sep 2019 10:14:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/sslh: fixup the 'v' prefix in
 the version
In-Reply-To: <20190915095832.467729c3@windsurf.home> (Thomas Petazzoni's
 message of "Sun, 15 Sep 2019 09:58:32 +0200")
References: <20190911174630.648-1-fontaine.fabrice@gmail.com>
 <8736gy58pm.fsf@dell.be.48ers.dk>
 <20190915095832.467729c3@windsurf.home>
Message-ID: <87d0g23rig.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Sun, 15 Sep 2019 09:17:57 +0200
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:  
 >> 
 >> > In order for the sslh version to match what is given by
 >> > release-monitoring.org, the 'v' prefix should be encoded in
 >> > SSLH_SOURCE and not SSLH_VERSION.  
 >> 
 >> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> > ---
 >> >  package/sslh/sslh.mk | 3 ++-  
 >> 
 >> You don't seem to change sslh.hash?

 > The tarball name doesn't change:

 > -SSLH_VERSION = v1.20
 > +SSLH_VERSION = 1.20
 > +SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz

 > This package is not fetched from Github, so it's not us who control the
 > tarball name. Here the tarball name is the one from upstream, and it
 > doesn't change, so the .hash file doesn't change.

 > After applying this patch:

 > sslh-v1.20.tar.gz: OK (sha256: a7f49b0a1cfcb7bb9d97f5ffa932bff11c5f65d9a9bd8fe1812481dee5855116)
 >>>> sslh 1.20 Extracting
 > gzip -d -c /home/thomas/dl/sslh/sslh-v1.20.tar.gz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/sslh-1.20   -xf -

Ahh yes, indeed - Sorry for the noise.

-- 
Bye, Peter Korsgaard
