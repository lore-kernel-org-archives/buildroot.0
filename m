From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 21:43:17 +0100
Subject: [Buildroot] [PATCH 1/1] documentation: hash source control
 archives
In-Reply-To: <1480344142-6382-1-git-send-email-ash.charles@savoirfairelinux.com>
References: <1480344142-6382-1-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <20161128214317.5cbbc846@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Nov 2016 09:42:22 -0500, Ash Charles wrote:

> -The +none+ hash type is reserved to those archives downloaded from a
> -repository, like a 'git clone', a 'subversion checkout'...
> +For archives downloaded from a repository e.g. from a 'git clone', a 'subversion checkout', using a locally-calculated sha256 hash is recommended although the +none+ type has also been used.

The line needs to be wrapped to 72 characters.

Also, I am not sure that the archives we produce from all version
control systems are reproducible. I'm sure it's the case for Git, but
I'm not sure for Subversion, so it might be that your statement is
actually wrong.

In addition, I think the last part "although the +none+ type has also
been used" is a bit confusing.

I think we should rather:

 1. Look again closely at which version control systems currently
    produce reproducible archives in Buildroot.

 2. Make Buildroot actually check the hashes for the downloads made
    through those version control systems.

 3. Update the documentation accordingly, with a clear statement of
    which packages should have hashes, which packages should not.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
