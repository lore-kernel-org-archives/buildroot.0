From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Apr 2021 13:09:46 +0200
Subject: [Buildroot] [PATCH 2/4] boot/shim: fix build issues with gcc 9.x
In-Reply-To: <20210405202155.1422470-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 5 Apr 2021 22:21:53 +0200")
References: <20210405202155.1422470-1-thomas.petazzoni@bootlin.com>
 <20210405202155.1422470-3-thomas.petazzoni@bootlin.com>
Message-ID: <87mtubfz45.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Backport a set of upstream patches to fix:
 > MokManager.c: In function ?write_back_mok_list?:
 > MokManager.c:1081:19: error: taking address of packed member of
 > ?struct <anonymous>? may result in an unaligned pointer value
 > [-Werror=address-of-packed-member]
 >  1081 |   if (CompareGuid(&(list[i].Type), &X509_GUID) == 0)
 >       |                   ^~~~~~~~~~~~~~~
 > MokManager.c:1103:19: error: taking address of packed member of
 > ?struct <anonymous>? may result in an unaligned pointer value
 > [-Werror=address-of-packed-member]
 >  1103 |   if (CompareGuid(&(list[i].Type), &X509_GUID) == 0) {
 >       |                   ^~~~~~~~~~~~~~~
 > MokManager.c: In function ?delete_cert?:
 > MokManager.c:1144:19: error: taking address of packed member of
 > ?struct <anonymous>? may result in an unaligned pointer value
 > [-Werror=address-of-packed-member]
 >  1144 |   if (CompareGuid(&(mok[i].Type), &X509_GUID) != 0)
 >       |                   ^~~~~~~~~~~~~~
 > MokManager.c: In function ?delete_hash_in_list?:
 > MokManager.c:1195:20: error: taking address of packed member of
 > ?struct <anonymous>? may result in an unaligned pointer value
 > [-Werror=address-of-packed-member]
 >  1195 |   if ((CompareGuid(&(mok[i].Type), &Type) != 0) ||
 >       |                    ^~~~~~~~~~~~~~
 > MokManager.c: In function ?delete_keys?:
 > MokManager.c:1359:19: error: taking address of packed member of
 > ?struct <anonymous>? may result in an unaligned pointer value
 > [-Werror=address-of-packed-member]
 >  1359 |   if (CompareGuid(&(del_key[i].Type), &X509_GUID) == 0) {
 >       |                   ^~~~~~~~~~~~~~~~~~
 > cc1: all warnings being treated as errors
 > make[1]: *** [<builtin>: MokManager.o] Error 1

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
