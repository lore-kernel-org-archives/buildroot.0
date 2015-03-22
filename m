From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2015 17:00:22 +0100
Subject: [Buildroot] Proposed patch: allow setting an hashed root
	password
In-Reply-To: <550EDB2A.9030107@sancho.ccd.uniroma2.it>
References: <550EDB2A.9030107@sancho.ccd.uniroma2.it>
Message-ID: <20150322160022.GC4724@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lorenzo, All,

On 2015-03-22 16:09 +0100, Lorenzo Catucci spake thusly:
> Please find enclosed my proposed patch. I've posted the patch to a GH fork of
> the main repository too: look at the ?hashed_root_pw? branch of
> 
> 	https://github.com/lmctv/buildroot
> 
> The reason I've enabled the new ?BR2_TARGET_GENERIC_ROOT_PASSWD_HASH?
> configuration option is being able to set a "*" password hash for the root
> user without being forced to put a static /etc/shadow inside BR2_ROOTFS_OVERLAY.
> 
> Even if setting a "real" password, I think the option to put a sha256 or
> sha512 hash in the .config is a lot less scary than putting a plaintext
> password, especially in the case of sha512 .
> 
> Thank you very much, yours
> 
> 	lorenzo m catucci
> 

NAK.

First, the commit log should only explain the technical reasons for the
change, and not contain "personal" messages:

    first line, short explanation

    One (or more) paragraph explainging the current situation and why
    you believe it is incorrect.

    One (or more) paragraph explaining what you changed.

    Signed-ogg-by: Your Real Name <your-email@somehwere.net>

Second, there's something odd: clearly the patch prefers the hashed
password over the clear-text one, but does not prevent the user to set
both.

Third, if you want to do tricky password handling like this, I think it
would be better if you passed a "user table" (BR2_ROOTFS_USERS_TABLES)
that defines the root user and its password, like documented in the
mkuser infra:
    http://buildroot.net/downloads/manual/manual.html#makeuser-syntax

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
