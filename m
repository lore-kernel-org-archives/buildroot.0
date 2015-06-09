From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:13:44 +0200
Subject: [Buildroot] [PATCH 1/1 v2] scripts/mkusers: allow users with no
 password value set
In-Reply-To: <1432403497-4132-1-git-send-email-james.knight@rockwellcollins.com>
References: <1432403497-4132-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20150609231344.69fed325@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Sat, 23 May 2015 13:51:37 -0400, James Knight wrote:
> The following allows a user definition to specify that a created user
> entry should not have a password value set. Original implementation
> allowed a user definition to provide a password value of "=" (no quotes)
> to generate a crypt-encoded empty string value. In some cases, it may be
> desired to have no value specified for a user's password. By using a
> value "-" for a password, no value will be set in the shadow value.
> 
> An example when this can be used is when logging into a terminal.
> Logging into a session with an encoded empty password will prompt a user
> to enter a password since it does not know the password is empty. If the
> password field blank, a login session will not prompt for a password.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> Changes v1 -> v2:
>   - Correct error in commit message.
>   - More explicit example in commit message (suggested by Yann).
>    
>  docs/manual/makeusers-syntax.txt | 3 ++-
>  support/scripts/mkusers          | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
