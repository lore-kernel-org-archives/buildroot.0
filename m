From: James J. Dines <jdines@jdines.net>
Date: Tue, 07 Sep 2010 12:34:59 -0400
Subject: [Buildroot] Why is extfs filesystem mandatory?
In-Reply-To: <20100907165546.06ed2a29@surf>
References: <4C863CDD.8020805@jdines.net> <20100907165546.06ed2a29@surf>
Message-ID: <4C8669B3.4030209@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/07/2010 10:55 AM, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 07 Sep 2010 09:23:41 -0400
> "James J. Dines" <jdines@jdines.net> wrote:
> 
<snip>
> 
>> This would not be an issue for me if I could simply disable said step,
>> however there seems to be no way to disable generation of the ext2
>> filesystem in the menuconfig.
>>
>> Is there a reason why this cannot be disabled?
> 
> make menuconfig
>  -> Target filesystem options
>    -> disable 'ext2 root filesystem'
> 
> Works here. It doesn't work for you ?
> 
> Regards,
> 
> Thomas

In the menuconfig, under "Target Filesystems" I have an asterisk
surrounded by dashes, i.e.:

- -*- ext2 root filesystem

... rather than brackets.

If I do a make defconfig I can indeed disable it, so I have attached an
example config where it is disabled in case it will help track down the
seeming error in a dependency somewhere.






-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMhmmxAAoJECSpOhdQESq65fkH/R6/rUPojzegplMfED9pdcT1
EDPkQsCnP0K3gVdXlB6qhAbh92IJJywC7jkF782LjEmQfMs/tsjYJs4uth+s02pw
c3dnwjjDr/RA2FtOUdo+skfPWLpE/6/SLzILYBAv1a/0rYyh42+8Da5sJP6FsiYq
OfU0/PDjKyXOGr6Rk6fnnA1Oi9vfw8Unx/eEW7h8PUd5MY4I7/oBYorqjW9R4OQq
7vuIVhqNJamAK339gP3A8xTv2ozn+p3gA+NmNovZn+m60P6VjBRuRhrkVsOXJlR2
6MeYSnLA6Bbb6scXOwQPtEf6tphCq5We+eW8N6Z3w5zpsjLaNmM/MdbD6bHKYQE=
=kH8y
-----END PGP SIGNATURE-----
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: config-buildroot
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100907/23d7b156/attachment-0001.ksh>
