From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Oct 2019 21:14:08 +0200
Subject: [Buildroot] [PATCH v2 7/9] package/netopeer2-keystored: add
 package
In-Reply-To: <20191009181553.GV10860@scaer>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <20191009112656.21232-8-heiko.thiery@gmail.com>
 <20191009141235.016e4b23@windsurf>
 <CAEyMn7a2w8vXSqHHmHtKmkn8okGVdOq=XSsbRaYtG_bOJ6T0hA@mail.gmail.com>
 <20191009153454.1f5f3e09@windsurf> <20191009155325.GU10860@scaer>
 <CAEyMn7YagOvss5TYDpZUvctz1xAiw=A72MZjj+Tw9gvjm9h35A@mail.gmail.com>
 <CAEyMn7YJKRYb_NLOgCpM=2tZ+jRHdtTB9g7xPpgGwRt400rtxw@mail.gmail.com>
 <20191009181553.GV10860@scaer>
Message-ID: <e8d59ac2-f0a5-79b4-9947-4fa8ecdab151@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/10/2019 20:15, Yann E. MORIN wrote:
[snip]
> You should keep doing three packages, like you initially submitted:
> 
>     package/netopeer2-keystored/Config.in
>     package/netopeer2-keystored/netopeer2-keystored.mk
>     package/netopeer2-keystored/netopeer2-keystored.hash
>     package/netopeer2-server/Config.in
>     package/netopeer2-server/netopeer2-server.mk
>     package/netopeer2-server/netopeer2-server.hash
>     package/netopeer2-cli/Config.in
>     package/netopeer2-cli/netopeer2-cli.hash
>     package/netopeer2-cli/netopeer2-cli.mk

 Note that two of the three hash files can be symlinks to the third one, so only
one hash file needs to be updated on a version bump.

 Since the server depends on keystored, I think it makes most sense to have
keystored as the "master" hash file. But it doesn't matter that much.


> 
> Then, you should add in the corresponding files:
> 
>     NETOPEER2_KEYSTORED_DL_SUBDIR = netopeer2
>     NETOPEER2_SERVER_DL_SUBDIR = netopeer2
>     NETOPEER2_CLI_DL_SUBDIR = netopeer2
> 
> That all three of them have the same _DL_SUBDIR means that the archive
> will be downloaded only once, and be used for all three packages (but
> this _DL_SUBDIR variable is indeed not documented in our manual).

 Call for contribution :-)

 Regards,
 Arnout

> 
> See for example: mesa3d and mesa3d-headers, or bluez5_utils and
> bluez5_utils-headers, for an example of using _DL_SUBDIR.
> 
> Regards,
> Yann E. MORIN.
> 
