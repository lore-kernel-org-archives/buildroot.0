From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 May 2012 16:13:12 +0200
Subject: [Buildroot] Why hiawatha is not managing IPV6 strictly
In-Reply-To: <1338471952.69324.YahooMailNeo@web28411.mail.ukl.yahoo.com>
References: <1338471952.69324.YahooMailNeo@web28411.mail.ukl.yahoo.com>
Message-ID: <20120531161312.6c85c244@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 31 May 2012 14:45:52 +0100 (BST),
Vincent de RIBOU <vins_bozo@yahoo.fr> a ?crit :

> Cmake config for Hiawatha uses only default IPV6 as activated.
> 
> Why not configuring if so through?BR2_INET_IPV6 option??

Because nobody did it. You can probably add something like
-DENABLE_IPV6=$(if $(BR2_INET_IPV6),ON,OFF) in the HIAWATHA_CONF_OPT.

Can you send a patch with this?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
