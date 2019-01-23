From: Alexander Dahl <post@lespocky.de>
Date: Wed, 23 Jan 2019 14:43:21 +0100
Subject: [Buildroot] Downloading at91bootstrap3 fails on recent master?
In-Reply-To: <87h8e0mikv.fsf@dell.be.48ers.dk>
References: <20190122143744.j5n5os57dcsds7qr@falbala.home.lespocky.de>
 <87h8e0mikv.fsf@dell.be.48ers.dk>
Message-ID: <20190123134321.ybndoube7a3u5jv6@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tue, Jan 22, 2019 at 11:30:08PM +0100, Peter Korsgaard wrote:
> >>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:
>  > I just pulled current master (2018.11-829-gd078cecdcf) and tried
>  > building atmel_sama5d27_som1_ek_mmc_dev_defconfig, like this:
> 
>  > (Note, env variable BR2_DL_DIR is set to:
>  > '/home/adahl/mnt/bagend-ia/src_archive'.)
> 
> Does it work if you don't set BR2_DL_DIR?

I tried again this morning after pulling the latest master (now at
2018.11-841-g9952e3b56e) and it worked then, but it should have not,
see below.

>  >>>> at91bootstrap3 v3.8.10 Downloading
>  > 	/home/adahl/mnt/bagend-ia/src_archive/at91bootstrap3/git/.git: Datei oder Verzeichnis nicht gefunden
> 
> I guess this is something like file not found? It sounds like your git
> clone has gotten corrupted?

Yes, ENOENT 2 No such file or directory, but German locale. ;-)

> It works here:
> 
> make at91bootstrap3-patch
> >>> at91bootstrap3 v3.8.10 Downloading
> Initialized empty Git repository in /var/lib/downloads/at91bootstrap3/git/.git/
> Fetching all references
> remote: Enumerating objects: 42, done.
> remote: Counting objects: 100% (42/42), done.
> remote: Compressing objects: 100% (42/42), done.
> remote: Total 8347 (delta 0), reused 42 (delta 0), pack-reused 8305
> Receiving objects: 100% (8347/8347), 3.38 MiB | 2.85 MiB/s, done.
> Resolving deltas: 100% (6301/6301), done.
> >From https://github.com/linux4sam/at91bootstrap
>  * [new branch]      at91bootstrap-3.x -> origin/at91bootstrap-3.x
>  * [new branch]      master            -> origin/master
>  * [new branch]      sam9x60_early     -> origin/sam9x60_early
>  * [new tag]         sam9x60_1.0       -> sam9x60_1.0
>  * [new tag]         5series_1.0          -> 5series_1.0
>  * [new tag]         5series_1.1          -> 5series_1.1
>  * [new tag]         5series_1.2          -> 5series_1.2
>  * [new tag]         5series_1.3          -> 5series_1.3
>  * [new tag]         Android4sam_v4.0     -> Android4sam_v4.0
>  * [new tag]         Android4sam_v4.1     -> Android4sam_v4.1
>  * [new tag]         Android4sam_v4.2     -> Android4sam_v4.2
>  * [new tag]         Android4sam_v4.3     -> Android4sam_v4.3
>  * [new tag]         Android4sam_v4.4     -> Android4sam_v4.4
>  * [new tag]         Android4sam_v4.4_rc1 -> Android4sam_v4.4_rc1
>  * [new tag]         Android4sam_v4.4_rc2 -> Android4sam_v4.4_rc2
>  * [new tag]         android4sam_v4.0     -> android4sam_v4.0
>  * [new tag]         linux4sam_5.6-rc1    -> linux4sam_5.6-rc1
>  * [new tag]         v3.5.1               -> v3.5.1
>  * [new tag]         v3.5.2               -> v3.5.2
>  * [new tag]         v3.5.3               -> v3.5.3
>  * [new tag]         v3.5.4               -> v3.5.4
>  * [new tag]         v3.6.0               -> v3.6.0
>  * [new tag]         v3.6.1               -> v3.6.1
>  * [new tag]         v3.6.2               -> v3.6.2
>  * [new tag]         v3.7                 -> v3.7
>  * [new tag]         v3.7.1               -> v3.7.1
>  * [new tag]         v3.7.2               -> v3.7.2
>  * [new tag]         v3.7.2-rc2           -> v3.7.2-rc2
>  * [new tag]         v3.8                 -> v3.8
>  * [new tag]         v3.8-alpha1          -> v3.8-alpha1
>  * [new tag]         v3.8-alpha2          -> v3.8-alpha2
>  * [new tag]         v3.8-alpha3          -> v3.8-alpha3
>  * [new tag]         v3.8-alpha4          -> v3.8-alpha4
>  * [new tag]         v3.8-alpha5          -> v3.8-alpha5
>  * [new tag]         v3.8-alpha6          -> v3.8-alpha6
>  * [new tag]         v3.8-alpha7          -> v3.8-alpha7
>  * [new tag]         v3.8-beta1           -> v3.8-beta1
>  * [new tag]         v3.8.1               -> v3.8.1
>  * [new tag]         v3.8.10              -> v3.8.10
>  * [new tag]         v3.8.10-rc1          -> v3.8.10-rc1
>  * [new tag]         v3.8.11              -> v3.8.11
>  * [new tag]         v3.8.11-rc1          -> v3.8.11-rc1
>  * [new tag]         v3.8.11-rc2          -> v3.8.11-rc2
>  * [new tag]         v3.8.11-rc3          -> v3.8.11-rc3
>  * [new tag]         v3.8.11-rc4          -> v3.8.11-rc4
>  * [new tag]         v3.8.12              -> v3.8.12
>  * [new tag]         v3.8.2               -> v3.8.2
>  * [new tag]         v3.8.3               -> v3.8.3
>  * [new tag]         v3.8.4               -> v3.8.4
>  * [new tag]         v3.8.5               -> v3.8.5
>  * [new tag]         v3.8.6               -> v3.8.6
>  * [new tag]         v3.8.7               -> v3.8.7
>  * [new tag]         v3.8.8               -> v3.8.8
>  * [new tag]         v3.8.8-rc2           -> v3.8.8-rc2
>  * [new tag]         v3.8.8-rc3           -> v3.8.8-rc3
>  * [new tag]         v3.8.9               -> v3.8.9
>  * [new tag]         v3.8.9-rc1           -> v3.8.9-rc1
>  * [new tag]         v3.8.9-rc2           -> v3.8.9-rc2
>  * [new tag]         v3.8.9-rc3           -> v3.8.9-rc3
>  * [new tag]         v3.8.9-rc4           -> v3.8.9-rc4
>  * [new tag]         v3.8.9-rc6           -> v3.8.9-rc6
>  * [new tag]         v3.8.9-rc7           -> v3.8.9-rc7
> remote: Enumerating objects: 1232, done.
> remote: Counting objects: 100% (1232/1232), done.
> remote: Total 2651 (delta 1232), reused 1232 (delta 1232), pack-reused 1419
> Receiving objects: 100% (2651/2651), 673.57 KiB | 0 bytes/s, done.
> Resolving deltas: 100% (2108/2108), completed with 141 local objects.
> >From https://github.com/linux4sam/at91bootstrap
>  * [new tag]         android4sam_v3.1 -> android4sam_v3.1
>  * [new tag]         v3.3             -> v3.3
>  * [new tag]         v3.4             -> v3.4
>  * [new tag]         v3.4.1           -> v3.4.1
>  * [new tag]         v3.4.2           -> v3.4.2
>  * [new tag]         v3.4.3           -> v3.4.3
>  * [new tag]         v3.4.4           -> v3.4.4
>  * [new tag]         v3.5.0           -> v3.5.0
> Could not fetch special ref 'v3.8.10'; assuming it is not special.
> >>> at91bootstrap3 v3.8.10 Extracting
> gzip -d -c /var/lib/downloads/at91bootstrap3/at91bootstrap3-v3.8.10.tar.gz | tar --strip-components=1 -C /home/peko/source/buildroot/output-at91/build/at91bootstrap3-v3.8.10   -xf -
> >>> at91bootstrap3 v3.8.10 Patching

I'm not sure why it used /var/lib/downloads/at91bootstrap3/git/.git/
this morning. Strange thing.

However, together with our administrator we could track it down.
Turned out the samba share we used for BR2_DL_DIR had this set:

  veto files = /.*/

That prevented to create some .git folder, which buildroot does. Now
I'm allowed to create (some) dotfiles on that share. Problem solved.

Anyway, thanks Peter for looking into that. :-)

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190123/29078a9a/attachment.asc>
