From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Nov 2017 11:40:36 +0100
Subject: [Buildroot] [PATCH v4 1/1] package/libssh2: Add selectable
 crypto libraries
In-Reply-To: <20171105081900.GC2996@scaer> (Yann E. MORIN's message of "Sun, 5
 Nov 2017 09:19:00 +0100")
References: <1509553376-43168-1-git-send-email-sam.voss@rockwellcollins.com>
 <9271f8cc-651b-e302-f82c-9e44a0af24d4@mind.be>
 <87tvy92lyy.fsf@dell.be.48ers.dk> <20171105081900.GC2996@scaer>
Message-ID: <87lgjl2el7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> >  This does affect people updating Buildroot, so it needs to be mentioned in CHANGES.
 >> 
 >> Why don't we just keep the old logic instead? E.G. leave the select
 >> openssl if !(mbedtls || libgcrypt) and then change the selects to
 >> depends on in the choice:
 >> 
 >> choice
 >> 
 >> config BR2_PACKAGE_LIBSSH2_MBEDTLS
 >> bool "mbedtls"
 >> depends on BR2_PACKAGE_MBEDTLS
 >> 
 >> ...
 >> 
 >> Doesn't that give us the best of both worlds? Same behaviour as before
 >> by default and still the option to explicitly chose when multiple
 >> backends are available?

 > That's what Sam did in the initial iterations of his patchset, but
 > Arnout and Thomas (IIRC) both requested he replaces that with a select
 > instead.

Hmm, I could only find Arnouts mail asking to use select, but he didn't
write why. Arnout, why not use depends on here?

-- 
Bye, Peter Korsgaard
