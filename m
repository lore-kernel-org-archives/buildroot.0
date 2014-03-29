From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 12:17:22 +0100
Subject: [Buildroot] [PATCH v2] postgresql: new package
In-Reply-To: <20140329111612.GC3227@free.fr>
References: <1395182160-26138-1-git-send-email-ps.report@gmx.net>
 <20140329115755.33e90c5b@skate> <20140329111612.GC3227@free.fr>
Message-ID: <20140329121722.2d709eba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 29 Mar 2014 12:16:12 +0100, Yann E. MORIN wrote:

> > Also, is there something that ensures that the /srv/pgsql/data
> > directory is owned by the postgres user and group, instead of the
> > default root user?
> 
> Yes, the mkuser script does chown the homes to the uid:gid of the user:
> the output of mkuser is put in the fakeroot script, and mkuser does:
> 
>     if [ "${home}" != "-" ]; then
>         mkdir -p "${TARGET_DIR}/${home}"
>         printf "chown -R %d:%d '%s'\n" "${uid}" "${_gid}" "${TARGET_DIR}/${home}"
>     fi

Ok, good to know, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
