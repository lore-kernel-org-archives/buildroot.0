From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 13 Jun 2017 00:24:58 +0200
Subject: [Buildroot] [PATCH v2 02/13] package/libspatialindex: new
	package
In-Reply-To: <0775a307-a8de-bd3e-1003-0b26612bc67a@gmail.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
 <20170612205410.20230-2-romain.naour@gmail.com>
 <20170612234540.7000c4a9@windsurf.lan>
 <0775a307-a8de-bd3e-1003-0b26612bc67a@gmail.com>
Message-ID: <402a9a12-2924-0584-39ea-47e82e3cc438@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Le 12/06/2017 ? 23:49, Romain Naour a ?crit :
> Hi Thomas,
> 
> Le 12/06/2017 ? 23:45, Thomas Petazzoni a ?crit :
>> Hello,
>>
>> On Mon, 12 Jun 2017 22:53:59 +0200, Romain Naour wrote:
>>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>>> Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>>
>> Applied, thanks!
>>
>>> test-pkg reported an internal compiler error on microblaze (br-microblazeel-full)
>>> Index.cc: In member function 'void SpatialIndex::RTree::Index::adjustTree(SpatialIndex::RTree::Node*, std::stack<long long int>&)':
>>> Index.cc:327:1: internal compiler error: in gen_reg_rtx, at emit-rtl.c:1027
>>
>> Does this bug still exists with gcc 7.x? If so, can we report the bug
>> to upstream gcc? Or is it a bug that has already been reported, because
>> it happens with other packages as well?
> 
> I need to test again with the new br-microblazeel-full toolchain added today.

Reproduced with br-microblaze-full-2017.05-444-g6c704ba.tar.bz2

Node.cc:1082:1: internal compiler error: in gen_reg_rtx, at emit-rtl.c:1025
 }
 ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
Makefile:388 : la recette pour la cible ? Node.lo ? a ?chou?e
make[4]: *** [Node.lo] Erreur 1
make[4]: *** Attente des t?ches non termin?es....
Index.cc: In member function 'void
SpatialIndex::RTree::Index::adjustTree(SpatialIndex::RTree::Node*,
std::stack<long long int>&)':
Index.cc:327:1: internal compiler error: in gen_reg_rtx, at emit-rtl.c:1025
 }
 ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
Makefile:388 : la recette pour la cible ? Index.lo ? a ?chou?e
make[4]: *** [Index.lo] Erreur 1
RTree.cc: In member function 'virtual bool
SpatialIndex::RTree::RTree::isIndexValid()':
RTree.cc:800:1: internal compiler error: in gen_reg_rtx, at emit-rtl.c:1025
 }
 ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.

I don't really know if there is an existing bug report.
I'll check that later.

Best regards,
Romain

> 
> Best regards,
> Romain
> 
>>
>> Thanks!
>>
>> Thomas
>>
> 
