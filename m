From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Sep 2018 08:57:25 +0200
Subject: [Buildroot] [PATCH 1/1] ipsec-tools: needs host-bison
In-Reply-To: <20180920084522.1dea57e8@windsurf> (Thomas Petazzoni's message of
 "Thu, 20 Sep 2018 08:45:22 +0200")
References: <20180915095906.11558-1-fontaine.fabrice@gmail.com>
 <87o9ctp5if.fsf@dell.be.48ers.dk> <20180920084522.1dea57e8@windsurf>
Message-ID: <87fty4psfe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> Hmm, shouldn't this use BR2_BISON_HOST_DEPENDENCY /
 >> BR2_FLEX_HOST_DEPENDENCY instead?

 > No, that's not what we have agreed so far. Our idea was that
 > BR2_BISON_HOST_DEPENDENCY and BR2_FLEX_HOST_DEPENDENCY would be used
 > only for the kconfig stuff in the kernel/u-boot and al, but that we
 > would keep using our own host-flex/host-bison for the rest, and
 > especially for target packages.

 > There are two reasons to that:

 >  (1) We can be pretty confident that the flex/bison stuff in kconfig
 >      will have been tested/exercised against a wide variety of
 >      flex/bison versions, so using whatever flex/bison version
 >      available on the host system is good enough. However, for the rest
 >      of the packages that use flex/bison, we can't be so sure, so
 >      having our own flex/bison version allows us to be sure that things
 >      "will work".

 >  (2) For target packages, using the system-provided flex/bison version
 >      means that the generated code can be subtly different between
 >      flex/bison versions, which makes the build non-reproducible. Hence,
 >      it is important to have our own fixed version of flex/bison. For
 >      host packages, that is probably less of a concern, but point (1)
 >      remains valid.

 > Do we still agree on this position, or do you have
 > counter-arguments ? :-)

No, you convinced me ;) Thanks!


-- 
Bye, Peter Korsgaard
