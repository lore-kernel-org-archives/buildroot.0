From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Jun 2021 21:08:36 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] package/libkrb5: add openssl optional dependency
In-Reply-To: <20210613200223.GU168928@scaer> (Yann E. MORIN's message of "Sun, 
 13 Jun 2021 22:02:23 +0200")
References: <20210613091044.877789-1-fontaine.fabrice@gmail.com>
 <20210613160845.GQ168928@scaer>
 <CAPi7W814yuL914ME3zQr-u2DpJmm52UUgL1VPjn7930+CF=7fg@mail.gmail.com>
 <20210613200223.GU168928@scaer>
Message-ID: <87o8bz9gsr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fabrice, All,
 > On 2021-06-13 18:41 +0200, Fabrice Fontaine spake thusly:
 >> Le dim. 13 juin 2021 ? 18:08, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
 >> > On 2021-06-13 11:10 +0200, Fabrice Fontaine spake thusly:
 >> > > openssl is an optional dependency which is enabled by default since at
 >> > > least 2007 and
 >> > > https://github.com/krb5/krb5/commit/4c17f25c0f106ec8e3aad2cee4e7a24f66b5a65d
 >> > >
 >> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> > I squashed the two commits together, because selecting the openssl
 >> > options is really just part of fixing the openssl dependency of libkrb5.
 >> Perhaps, it would have been better to keep them separate as Peter will
 >> probably only want to backport the first patch to 2020.xx and 2021.xx
 >> branches?

 > That's true.

 > However, semantically, I still believe the two patches should really
 > have been one, because if we don't select the options when we explicitly
 > add the openssl depenency, then we are still introducing a failure.

 > And I don't think that it is unreasonable to expect that some commits
 > have to be adapted when backported.

Indeed. Committed to 2021.02.x and 2021.05.x, after dropping the openssl
options - thanks.

-- 
Bye, Peter Korsgaard
