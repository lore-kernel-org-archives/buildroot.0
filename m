From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 May 2010 13:50:30 +0200
Subject: [Buildroot] [PATCH 3/8] libcap: fix build failure
In-Reply-To: <20100519133032.2b69d01b@surf> (Thomas Petazzoni's message of
	"Wed, 19 May 2010 13:30:32 +0200")
References: <cover.1273836748.git.thomas.petazzoni@free-electrons.com>
	<cover.1273836748.git.thomas.petazzoni@free-electrons.com>
	<e9598edb22c53d1463e61c2a6c3427ca7273d908.1273836748.git.thomas.petazzoni@free-electrons.com>
	<87aarz0xye.fsf@macbook.be.48ers.dk> <20100519133032.2b69d01b@surf>
Message-ID: <87iq6kxg8p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On a x86-64 host, libcap tried to install things in
 Thomas> $(STAGING_DIR)/lib64 and $(TARGET_DIR)/lib64. Therefore, pass lib= and
 Thomas> prefix=, as required by the strange build system used by libcap.
 >> 
 >> Wouldn't that be /USR/lib64 -> /USR/lib ?

 Thomas> Not sure what you mean here. The problem was that the libcap
 Thomas> build system was installing things in $(STAGING_DIR)/lib64
 Thomas> because it was thinking I was building for a 64 bits system
 Thomas> (but only my host was 64 bits, not my target).

Yes, but it should presumably install into /usr/lib rather than /lib(64)
(that's atleast where it's installed on my Debian machine).

-- 
Bye, Peter Korsgaard
