From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 13 Dec 2014 01:19:13 +0100
Subject: [Buildroot] [v3,
	12/12] Add option for paranoid unsafe path checking
In-Reply-To: <1418429047.1462.11.camel@posteo.de>
References: <1418429047.1462.11.camel@posteo.de>
Message-ID: <548B8601.8050109@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?rg,

Le 13/12/2014 01:04, J?rg Krause a ?crit :
> Hi Romain Naour,
> 
> what should I do if a package build fails because of an unsafe path
> error? Propose a patch for the package?
> 

Yes, you needs patch the package's build system to remove the host path.

This error appear if one of the following paths is used during the
cross-compilation:
"/lib"
"/usr/include"
"/usr/lib"
"/usr/local/include"
"/usr/local/lib"

Also, you can disable the paranoid wrapper in
Build options > Advanced > paranoid check of library/header paths
(You'll just have a warning)

Best regards,
-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
