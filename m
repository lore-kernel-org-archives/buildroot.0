From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 3 Feb 2019 22:01:23 +0100
Subject: [Buildroot] [PATCH] package/openssh: Set /var/empty permissions
In-Reply-To: <10b66c1b-f710-cee3-d646-973ab9ed4003@licor.com>
References: <20181217222522.13499-1-chris.lesiak@licor.com>
 <5a82d54f-a308-bd2f-f3f9-49b583196333@mind.be>
 <10b66c1b-f710-cee3-d646-973ab9ed4003@licor.com>
Message-ID: <28943e62-e93f-706f-a52e-c859b5e87cf8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/12/2018 00:37, Chris Lesiak wrote:
> I can certainly submit a new version that adds the following change:
> 
>  ?define OPENSSH_USERS
> -?????? sshd -1 sshd -1 * - - - SSH drop priv user
> +?????? sshd -1 sshd -1 * /var/empty /bin/false - SSH drop priv user
>  ?endef
> 
> 
> Is everyone happy with using /var/empty as the home directory? It isn't 
> obvious that /var/empty should belong to sshd.

 It doesn't belong to sshd. There are plenty of system users that have home
directories like / or /sbin.

 Note that there is no need to set the shell. - does not exist, so logging in as
that user doesn't work, which is what we want. I even think login treats it special.

 But changing the home directory of sshd would probably be good.

 Regards,
 Arnout
