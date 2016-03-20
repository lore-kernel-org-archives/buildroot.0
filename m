From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 22:14:49 +0100
Subject: [Buildroot] [PATCH 1/2] libglib2: improve dev file handling
In-Reply-To: <1457621557-23336-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457621557-23336-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160320221449.7eff12f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Mar 2016 11:52:36 -0300, Gustavo Zacarias wrote:
> Remove source schema files from target
> (/usr/share/glib-2.0/schemas/*.dtd and *.xml) at target finalization
> time.
> This is because other packages install schemas as well to avoid
> duplicating file removal efforts all around.
> 
> Add a schema compiler run on target finalization as well - we previously
> didn't do this since not many packages use it, however the upcoming
> connman-gtk package does require a valid gschemas.compiled to work
> properly.
> We also do this at target finalization to avoid each package handling
> this on their own.
> 
> Purge some extra binaries and files from the target, like the schema
> compiler to save additional space since they're unused at run time.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libglib2/libglib2.mk | 37 +++++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
