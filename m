From: Heiko Thiery <Heiko.Thiery@kontron.com>
Date: Wed, 4 Dec 2019 13:11:45 +0000
Subject: [Buildroot] [PATCH 6/7] libnetconf2: adjust dependencies
In-Reply-To: <6c981692-5631-4157-9ac7-c3f4da30e917@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
 <8c74f9fdebe7eef326420f5354f3ec8163930074.1575456104.git.jan.kundrat@cesnet.cz>
 <9d41e44617fd43d6be09f8b9da673643@kontron.com>
 <6c981692-5631-4157-9ac7-c3f4da30e917@cesnet.cz>
Message-ID: <cf2c2533a5374a80907d26b8cff7f612@kontron.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Urspr?ngliche Nachricht-----
> Von: Jan Kundr?t [mailto:jan.kundrat at cesnet.cz]
> Gesendet: Mittwoch, 4. Dezember 2019 14:01
> An: Heiko Thiery
> Cc: buildroot at buildroot.org; Fabrice Fontaine
> Betreff: Re: [Buildroot] [PATCH 6/7] libnetconf2: adjust dependencies
> 
> > The intention was to be able to select the SSH/TLS support by
> > providing/selecting the dependent package.
> >
> > Do you think that is not reasonable?
> 
> I think that the code in current buildroot does not enforce this. I.e., in case I
> have neither openssl nor libssh+server already selected, I will end up with a
> libnetconf2 which cannot do anything. I think that that is confusing.
> 
> There are other options, of course:
> 
> - We could add nested suboptions below BR2_PACKAGE_LIBNETCONF2 which
> would pick  the corresponding depenency. That way, people would at least have
> a hint that they should drill down within KConfig and notice that there are two
> options. Both of these could be checked by default. Disadvantage: if the
> libssh+server or openssl gets enabled later, there's a risk that these two get out
> of sync.
> 
> - We coud just add a hard dependency on both. That IMHO also makes sense
> because I have a feeling that the majority of people actually want both ways.

Just tried to add you're patch and see that with that at least the package testing (utils/test-pkg -p sysrep) will not work without providing a config-snippet that enables one of them (ssl or ssh).

@thomas: is that a valid way (package cannot be tested without config-snippet) or do we have to select the required dependencies to have the test abilitiy?

> Jan
