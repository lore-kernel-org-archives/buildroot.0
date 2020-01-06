From: Trent Piepho <trent.piepho@synapse.com>
Date: Mon, 6 Jan 2020 20:58:53 +0000
Subject: [Buildroot] [PATCH v3,
 1/1] package/samba4: Do not force target python
In-Reply-To: <20200103134341.1505177-1-fontaine.fabrice@gmail.com>
References: <20200103134341.1505177-1-fontaine.fabrice@gmail.com>
Message-ID: <f9c453d2c255c9bf5eae3a95da77da2520441742.camel@synapse.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2020-01-03 at 14:43 +0100, Fabrice Fontaine wrote:
> Samba does not need python on the target for file server functionality.
> It does need it for the Active Directory Domain Controller feature,
> which is already configured in buildroot as optional and already depends
> on python3 since commit 4485a75859fbae99090b065ddd7c088a65571d37.
> 
> An unnecessary target python greatly increases the size of the target
> filesystem. A somewhat minimal configuration with a samba server shunk
> from an 82 MB rootfs to 53 MB with this patch.
> 
> Signed-off-by: Trent Piepho <trent.piepho@synapse.com>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Only drop select in Config.in
> 
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Rework patch due so it can be applied after commits
>    fe033bdf534a7892ced72c11635d863afa92d1d2 and
>    4485a75859fbae99090b065ddd7c088a65571d37

Test v3 and it looks good to me.  After commit fe033bd added the
disable-python logic, the samba4.mk part of my origina v1 isn't needed
anymore to get a working build.
