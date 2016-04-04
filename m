From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Apr 2016 00:39:48 +0200
Subject: [Buildroot] need help with adding python-mysqldb
In-Reply-To: <CAPTQzABFmehM_FhTOvMWO9Jmc63u8BLX1sG1B_zDU=OED57nVA@mail.gmail.com>
References: <CAPTQzABFmehM_FhTOvMWO9Jmc63u8BLX1sG1B_zDU=OED57nVA@mail.gmail.com>
Message-ID: <5702ED34.5060405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/05/16 00:28, Anatoly Asviyan wrote:
> Hi
> I am trying to add python-mysqldb package. I 've patched buildroot (the patch is
> here
> https://gist.githubusercontent.com/aanatoly/997d7ced70aaf9e13d57b5cc85751862/raw/3d71a992e748d9c40ca1961b0dd951fb300184d0/python-mysqldb.patch)
>
> but make fails with this error
>
>>>> python-mysqldb 1.2.5 Downloading
> --2016-04-05 00:55:28--http://pypi.python.org/packages/source/M/MySQL-python/MySQL-python-1.2.5.zip
> Resolvingpypi.python.org <http://pypi.python.org>  (pypi.python.org <http://pypi.python.org>)... 185.31.17.223
> Connecting topypi.python.org <http://pypi.python.org>  (pypi.python.org <http://pypi.python.org>)|185.31.17.223|:80... connected.
> HTTP request sent, awaiting response... 301 Moved Permanently
> Location:https://pypi.python.org/packages/source/M/MySQL-python/MySQL-python-1.2.5.zip  [following]
> --2016-04-05 00:55:29--https://pypi.python.org/packages/source/M/MySQL-python/MySQL-python-1.2.5.zip
> Connecting topypi.python.org <http://pypi.python.org>  (pypi.python.org <http://pypi.python.org>)|185.31.17.223|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 108935 (106K) [application/octet-stream]
> Saving to: `/home/me/work/buildroot-x86_64/output/build/.MySQL-python-1.2.5.zip.ip6WvS/output'
>
> 100%[=====================================================================================================================>] 108,935     --.-K/s   in 0.1s
>
> 2016-04-05 00:55:29 (946 KB/s) - `/home/me/work/buildroot-x86_64/output/build/.MySQL-python-1.2.5.zip.ip6WvS/output' saved [108935/108935]
>
> WARNING: no hash file for MySQL-python-1.2.5.zip
>>>> python-mysqldb 1.2.5 Extracting
> /home/me/work/buildroot-x86_64/dl/MySQL-python-1.2.5.zip | tar --strip-components=1 -C /home/me/work/buildroot-x86_64/output/build/python-mysqldb-1.2.5   -xf -
> /bin/bash: /home/me/work/buildroot-x86_64/dl/MySQL-python-1.2.5.zip: Permission denied
> tar: This does not look like a tar archive
> tar: Exiting with failure status due to previous errors

  That's a zip file, so you'll have to give custom extract commands to unzip it.

> make[1]: *** [/home/me/work/buildroot-x86_64/output/build/python-mysqldb-1.2.5/.stamp_extracted] Error 2
> make: *** [_all] Error 2
>
>
> It looks like it runs "foo.zip | tar ..." instead of "unzip foo.zip | tar ...".
> I can't figure why. Other zip'ed packages are built ok, for example python-keyring.

  Look at PYTHON_KEYRING_EXTRACT_CMDS.


  However, MySQL-python seems to be dead. Why not use the better-maintained 
PyMySQL? There is already a patch for it:
http://patchwork.ozlabs.org/patch/602638/


  Regards,
  Arnout
>
> --
> Regards, Anatoly
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
