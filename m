From: Carlos Santos <casantos@datacom.com.br>
Date: Sun, 10 Jun 2018 10:38:08 -0300 (BRT)
Subject: [Buildroot] [PATCH] docs/manual: document filesystems
In-Reply-To: <20180610081217.GB2471@scaer>
References: <20180609094647.21460-1-yann.morin.1998@free.fr>
 <1806912659.2037633.1528582803656.JavaMail.zimbra@datacom.com.br>
 <20180610081217.GB2471@scaer>
Message-ID: <1789748625.2040845.1528637888756.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann Morin" <yann.morin.1998@free.fr>
> To: "DATACOM" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Thomas De Schampheleire" <patrickdepinguin@gmail.com>, "Thomas Petazzoni"
> <thomas.petazzoni@bootlin.com>, "Peter Korsgaard" <peter@korsgaard.com>, "Arnout Vandecappelle" <arnout@mind.be>
> Sent: Sunday, June 10, 2018 5:12:17 AM
> Subject: Re: [PATCH] docs/manual: document filesystems

> Carlos, All,
> 
> Thanks for the review! :-)
> 

[...]

>> Genarating filesystem images do not modify the
>> contents of the global $(TARGET_DIR) and user-provided rootfs extensions
>> must not do this.
> 
> Why do you insist on modifying the global target/ directory from your
> filesystem? If you do that, and build two or more filesystems [*], they
> might each try to modify target/ is incompatible ways, and this is not
> even safe, concurrency-wise (e.g. ony may try to archive the content of
> /var while another is doing a rm -rf on it.)

I never intended to modify the global $(TARGET_DIR).

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
