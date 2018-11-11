From: Carlos Santos <casantos@datacom.com.br>
Date: Sun, 11 Nov 2018 21:36:23 -0200 (BRST)
Subject: [Buildroot] [PATCH] acpid: Make bundled event files optional
In-Reply-To: <20181111215016.4bb45836@windsurf.home>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111150652.17459-6-alexander.sverdlin@gmail.com>
 <20181111215016.4bb45836@windsurf.home>
Message-ID: <903666942.1452646.1541979383170.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



----- Original Message -----
> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Alexander Sverdlin" <alexander.sverdlin@gmail.com>
> Cc: "buildroot" <buildroot@buildroot.org>, "DATACOM" <casantos@datacom.com.br>
> Sent: Domingo, 11 de novembro de 2018 18:50:16
> Subject: Re: [Buildroot] [PATCH] acpid: Make bundled event files optional

> Hello Alexander,
> 
> Adding in Cc: Carlos Santos, who recently tweakedthe powerbtn script
> logic.
> 
> On Sun, 11 Nov 2018 16:06:51 +0100, Alexander Sverdlin wrote:
>> On one hand the preinstalled /etc/acpi/events/powerbtn is not part of
>> acpid, one other hand others might want to implement more complicated logic
>> on power button. Therefore, make it optional.
>> 
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> On the other hand, it makes quite a bit of sense to have some kind of
> default/minimal behavior for this, which can easily be overridden in a
> post-build script / root filesystem overlay.

Exactly.

> To me, this is a little bit like "let's make the installation of the
> OpenSSH server configuration file optional, because the default doesn't
> suite me".
> 
>> +if BR2_PACKAGE_ACPID
>> +
>> +config BR2_PACKAGE_ACPID_SUPPLEMENTARY
> 
> If anything, the name of the option should be revisited, because
> "supplementary" is quite vague.
> 
> But overall, I'm not really convinced that we need to change anything
> here, I believe the current behavior is OK.

I'm not 100% against this change because it makes the installation of
the powerbtn script optional but leaves the option chosen by default,
so it does not change the current behavior.

Power button handling, however, is a very basic behavior that I'm a bit
afraid of making optional.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
