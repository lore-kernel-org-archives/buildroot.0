From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Oct 2017 00:10:55 +0200
Subject: [Buildroot] [PATCH v2] nmap: add option to build/install "ncat"
In-Reply-To: <1eb061ff-7182-4ee3-15ab-8f2068db4696@mind.be>
References: <20171004124920.7358-1-casantos@datacom.ind.br>
 <20171004154313.25762-1-casantos@datacom.ind.br>
 <f45e607f-ebff-129a-0064-de7fa4255be6@mind.be>
 <1613988304.12988742.1507565613269.JavaMail.zimbra@datacom.ind.br>
 <1eb061ff-7182-4ee3-15ab-8f2068db4696@mind.be>
Message-ID: <5d1dc740-1eda-8052-1ee0-c8a543524a7b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-10-17 00:08, Arnout Vandecappelle wrote:
> 2. No specific option, always install nmap + ncat if BR2_PACKAGE_NMAP is
> selected. Note that this might create a problem if both nmap and netcat-openbsd
> are selected, so there should probably be a dependency introduced and a check
> that nc doesn't exist yet before creating the symlink.

 Let me clarify that bit: in all the other options, the user makes a conscious
decision to enable ncat (and therefore the nc symlink). With this option,
however, the nc symlink will be created without the user being aware of it, so
it could be that it is not what the user intended. This is only a problem if
netcat-openbsd is also installed (since ncat is a strict superset of GNU and
busybox nc).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
