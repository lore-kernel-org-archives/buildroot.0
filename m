From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Oct 2015 23:39:21 +0100
Subject: [Buildroot] [git commit] package/initscripts: S40network: wait
 for network interfaces to appear
In-Reply-To: <562F426C.4010500@green-communications.fr>
References: <20151016111136.50FA381F8A@busybox.osuosl.org>
 <CAMQcK5K7pKFBoN9N2hv4oLscew6qTWvj9RhfiCviLako0VzdRg@mail.gmail.com>
 <562F426C.4010500@green-communications.fr>
Message-ID: <562FFD19.8020204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27-10-15 10:22, Nicolas Cavallari wrote:
> However, true virtual interfaces may also be defined in
> /etc/network/interfaces and created via a pre-up stanza:
> 
> auto br0
> iface br0 inet static
>     pre-up ip link add br0 type bridge
>     post-down ip link del br0
>     address 203.0.113.42
>     netmask 255.255.255.0
> 
> In this case, S40network will wait forever.  However, if the feature
> was implemented via ifupdown pre-up hooks, then this use-case could
> actually work, since hooks are executed after pre-up stanzas. But that
> is maybe too complex for buildroot.

 Actually, this sounds less complicated than the script we currently have.

 At least, if both busybox and ifupdown behave the same way.

 Does systemd use /etc/network/interfaces and/or the hooks?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
