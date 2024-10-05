Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A36CFB42C
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 20:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97B70606A3;
	Sat,  5 Oct 2024 20:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Gv8Q6K2kh3a; Sat,  5 Oct 2024 20:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC07A60687
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC07A60687;
	Sat,  5 Oct 2024 20:28:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 283481BF5A5
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 20:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 245A28104B
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 20:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxDW6ZPn1b-p for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 20:28:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 585AA81011
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 585AA81011
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 585AA81011
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 20:27:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.114.128]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2mFY-1tzzJ53OZg-017DpK; Sat, 05
 Oct 2024 22:22:47 +0200
Message-ID: <e45dfce2-04a3-4bb3-b863-82f0fd0e37e1@gmx.de>
Date: Sat, 5 Oct 2024 22:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240927203642.355640-1-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240927203642.355640-1-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:PDh34NwEdEXb5a1y9vqAL7F23WU0s1tL6jTwt1Gwj7jRDzMV54X
 tvkf4CJG0471KWqUUy39yfwQBapBZLvHgkqyZqgmta0HsRC7CXU8dEFT9V+ITi7U9pOIEqC
 m5EJYcQEWfBOfcNIaV7uVr1j4Q/IDVo/hKSF28lifLblIwgvUtcQ/9p9zg6+30WT+8EOxbS
 MI71zova5Kd/PSf8U0xeA==
UI-OutboundReport: notjunk:1;M01:P0:Xie2BW+I228=;ZUJ4+CmvW53oAc/2uDDMWG58yBp
 ptCcjhbr7usoiTYbFpDzaZhtOFWwt7X2pNL0b30Lfmhiy4CZzSonwD5dTM7iF3xZi/Yw86RyQ
 eNBk6wOrt0ef4Ap5zooT+Gdnkl9wPYfRwjvta6zssoooEVGgtw7UEnC1JSb7YqvrxgCaPMWZb
 TmidousaSWcxbQxO3HHO+1H3+lTraUBrzNvHvWpfhcQEVw6JTdz0aJZ8kqjR9d9it3xdHiiG9
 h1v/1fyX9j7k26b3Rnu6Tni8MYgpar4zDnB/gumiBIHeLwRDr634wylbAHMmfWgzIWfch8Byy
 ayOqFpakswwSCS3H7JLE645C2IjZjhywIo05EEQkpD4t3kR0HpABg1T9fTbS4Bu6iIqkElJzO
 nTHurJdsTWO0ZyuysGOdWGHZrIJ59Wcs7R1yTILIwsJSLQPEmA5SnB+TnXpJlGYUC4SdSNTez
 FH77wYsXfOLAvUwVcgEp+ctrYnGqFnwfHmbQJ1MLUq77Mi75XHESTCUs+g+nLPSyYnD1W6LJj
 4biOHo2HssHT5/I7aPneG4DjhNwJy2vpfF+fupNxIZ/jD14p7xeFPXYv+adi51AJv8e9xOA5R
 Z8yYiGhfqABp/UK5dyXdwyTe35Ksq/b7melTvO+PLOZuILObGKf3AkMIYv+ZO8NwoszCDZGSN
 4ahfx7B3r7FPpTe5a7vE5m6aEXCAEgfHmIYlygWSDn5j5+F9TJm0a2v1kzMteZXnUOw0+A9v0
 PwIJTIDMEWSvSJt2ei1IrrTF6+ENz660NYHVr9C1uc9/9cuqQxA4iS7R0wAQLY2HFnvMMXAMG
 TNTkfwo5mtPJokqN4UYEmQcQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1728160076; x=1728764876; i=fiona.klute@gmx.de;
 bh=v2boJJPDsO5EKuQnfs36yi8Y3mkxgw5ylrIgx57wCuI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ti3vLyAXv7Z3kwksPRBkdpvYo2H/LB2HvVQbdCanuMn5MyaUTSR5UtQTzNeE49/w
 yT1adIJei/JaQXl03FG2zI9uJQ6u1xVna5gJpaAGHIUYJSk+5M9wZ/DHPLXNK2XVl
 wookgMeK15TXErYYG0grnP0BNyJAmBAIsumfBG9sZGPrZPXoU7c4z4w3iXp5FvDF9
 Huagsfh4yKOTZJxTh84rv7FRAtGiaUCWNMA9MoxxuEx/Wdb6CKjylB3dWJ+nrxq2K
 tJd2PvRmQ6r2hqj+S4hdOV40ctE4Z+SZn6TueaNuQwG6WOH5AS8gHpFoPmtZ5rgQ+
 nP/hNjouCHmYwTBn/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ti3vLyAX
Subject: Re: [Buildroot] [PATCH v4 1/1] utils/scanpypi: refactor setuptools
 handling to not use imp
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 27.09.24 um 22:36 schrieb James Hilliard:
> The imp module is deprecated as of python verison 3.12.
>
> Refactor setuptools handling to remove monkeypatching hack and
> instead do pep517 metadata generation and dependency resolution.
>
> This is effectively done by implementing the minimal neccesary
> pep517 frontend hooks needed for dependency resolution in scanpypi.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reviewed-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

For testing I re-imported a few packages I set up previously, and
verified the diff matches the manual adjustments that were needed before.

Thanks,
Fiona

> ---
> Changes v3 -> v4:
>    - rebase
> Changes v2 -> v3:
>    - support pep517 dependency resolution for all build systems
>    - replace setuptools specific load_setup with generic load_metadata
>    - remove setuptools load_setup fallback exception hacks
> Changes v1 -> v2:
>    - split out set comprehension changes
> ---
>   utils/scanpypi | 173 ++++++++++++++++++++++++++++---------------------
>   1 file changed, 100 insertions(+), 73 deletions(-)
>
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 8765a98323..430bb4757d 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -18,8 +18,9 @@ import hashlib
>   import re
>   import textwrap
>   import tempfile
> -import imp
> -from functools import wraps
> +import traceback
> +import importlib
> +import importlib.metadata
>   import six.moves.urllib.request
>   import six.moves.urllib.error
>   import six.moves.urllib.parse
> @@ -93,32 +94,6 @@ def toml_load(f):
>           raise ex
>
>
> -def setup_decorator(func, method):
> -    """
> -    Decorator for distutils.core.setup and setuptools.setup.
> -    Puts the arguments with which setup is called as a dict
> -    Add key 'method' which should be either 'setuptools' or 'distutils'.
> -
> -    Keyword arguments:
> -    func -- either setuptools.setup or distutils.core.setup
> -    method -- either 'setuptools' or 'distutils'
> -    """
> -
> -    @wraps(func)
> -    def closure(*args, **kwargs):
> -        # Any python packages calls its setup function to be installed.
> -        # Argument 'name' of this setup function is the package's name
> -        BuildrootPackage.setup_args[kwargs['name']] = kwargs
> -        BuildrootPackage.setup_args[kwargs['name']]['method'] = method
> -    return closure
> -
> -# monkey patch
> -import setuptools  # noqa E402
> -setuptools.setup = setup_decorator(setuptools.setup, 'setuptools')
> -import distutils   # noqa E402
> -distutils.core.setup = setup_decorator(setuptools.setup, 'distutils')
> -
> -
>   def find_file_upper_case(filenames, path='./'):
>       """
>       List generator:
> @@ -156,6 +131,44 @@ class DownloadFailed(Exception):
>       pass
>
>
> +class BackendUnavailable(Exception):
> +    """Raised if we cannot import the backend"""
> +
> +    def __init__(self, message, traceback=None):
> +        super().__init__(message)
> +        self.message = message
> +        self.traceback = traceback
> +
> +
> +class BackendPathFinder:
> +    """Implements the MetaPathFinder interface to locate modules in ``backend-path``.
> +
> +    Since the environment provided by the frontend can contain all sorts of
> +    MetaPathFinders, the only way to ensure the backend is loaded from the
> +    right place is to prepend our own.
> +    """
> +
> +    def __init__(self, backend_path, backend_module):
> +        self.backend_path = backend_path
> +        self.backend_module = backend_module
> +        self.backend_parent, _, _ = backend_module.partition(".")
> +
> +    def find_spec(self, fullname, _path, _target=None):
> +        if "." in fullname:
> +            # Rely on importlib to find nested modules based on parent's path
> +            return None
> +
> +        # Ignore other items in _path or sys.path and use backend_path instead:
> +        spec = importlib.machinery.PathFinder.find_spec(fullname, path=self.backend_path)
> +        if spec is None and fullname == self.backend_parent:
> +            # According to the spec, the backend MUST be loaded from backend-path.
> +            # Therefore, we can halt the import machinery and raise a clean error.
> +            msg = f"Cannot find module {self.backend_module!r} in {self.backend_path!r}"
> +            raise BackendUnavailable(msg)
> +
> +        return spec
> +
> +
>   class BuildrootPackage():
>       """This class's methods are not meant to be used individually please
>       use them in the correct order:
> @@ -191,6 +204,8 @@ class BuildrootPackage():
>           self.metadata_url = None
>           self.pkg_req = None
>           self.setup_metadata = None
> +        self.backend_path = None
> +        self.build_backend = None
>           self.tmp_extract = None
>           self.used_url = None
>           self.filename = None
> @@ -339,32 +354,46 @@ class BuildrootPackage():
>               folder=tmp_pkg,
>               name=pkg_filename)
>
> -    def load_setup(self):
> +    def load_metadata(self):
>           """
>           Loads the corresponding setup and store its metadata
>           """
>           current_dir = os.getcwd()
>           os.chdir(self.tmp_extract)
> -        sys.path.insert(0, self.tmp_extract)
>           try:
> -            s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
> -            imp.load_module('__main__', s_file, s_path, s_desc)
> -            if self.metadata_name in self.setup_args:
> -                pass
> -            elif self.metadata_name.replace('_', '-') in self.setup_args:
> -                self.metadata_name = self.metadata_name.replace('_', '-')
> -            elif self.metadata_name.replace('-', '_') in self.setup_args:
> -                self.metadata_name = self.metadata_name.replace('-', '_')
> +            mod_path, _, obj_path = self.build_backend.partition(":")
> +
> +            path_finder = None
> +            if self.backend_path:
> +                path_finder = BackendPathFinder(self.backend_path, mod_path)
> +                sys.meta_path.insert(0, path_finder)
> +
> +            try:
> +                build_backend = importlib.import_module(self.build_backend)
> +            except ImportError:
> +                msg = f"Cannot import {mod_path!r}"
> +                raise BackendUnavailable(msg, traceback.format_exc())
> +
> +            if obj_path:
> +                for path_part in obj_path.split("."):
> +                    build_backend = getattr(build_backend, path_part)
> +
> +            if path_finder:
> +                sys.meta_path.remove(path_finder)
> +
> +            prepare_metadata_for_build_wheel = getattr(
> +                build_backend, 'prepare_metadata_for_build_wheel'
> +            )
> +            metadata = prepare_metadata_for_build_wheel(self.tmp_extract)
>               try:
> -                self.setup_metadata = self.setup_args[self.metadata_name]
> -            except KeyError:
> -                # This means setup was not called
> -                print('ERROR: Could not determine package metadata for {pkg}.\n'
> -                      .format(pkg=self.real_name))
> -                raise
> +                dist = importlib.metadata.Distribution.at(metadata)
> +                self.metadata_name = dist.name
> +                if dist.requires:
> +                    self.setup_metadata['install_requires'] = dist.requires
> +            finally:
> +                shutil.rmtree(metadata)
>           finally:
>               os.chdir(current_dir)
> -            sys.path.remove(self.tmp_extract)
>
>       def load_pyproject(self):
>           """
> @@ -372,28 +401,29 @@ class BuildrootPackage():
>           """
>           current_dir = os.getcwd()
>           os.chdir(self.tmp_extract)
> -        sys.path.insert(0, self.tmp_extract)
>           try:
>               pyproject_data = toml_load('pyproject.toml')
> -            try:
> -                self.setup_metadata = pyproject_data.get('project', {})
> -                self.metadata_name = self.setup_metadata.get('name', self.real_name)
> -                build_system = pyproject_data.get('build-system', {})
> -                build_backend = build_system.get('build-backend', None)
> -                if build_backend and build_backend == 'flit_core.buildapi':
> +            self.setup_metadata = pyproject_data.get('project', {})
> +            self.metadata_name = self.setup_metadata.get('name', self.real_name)
> +            build_system = pyproject_data.get('build-system', {})
> +            build_backend = build_system.get('build-backend', None)
> +            self.backend_path = build_system.get('backend-path', None)
> +            if build_backend:
> +                self.build_backend = build_backend
> +                if build_backend == 'flit_core.buildapi':
>                       self.setup_metadata['method'] = 'flit'
> -                elif build_system.get('backend-path', None):
> -                    self.setup_metadata['method'] = 'pep517'
> +                elif build_backend == 'setuptools.build_meta':
> +                    self.setup_metadata['method'] = 'setuptools'
>                   else:
> -                    self.setup_metadata['method'] = 'unknown'
> -            except KeyError:
> -                print('ERROR: Could not determine package metadata for {pkg}.\n'
> -                      .format(pkg=self.real_name))
> -                raise
> +                    if self.backend_path:
> +                        self.setup_metadata['method'] = 'pep517'
> +                    else:
> +                        self.setup_metadata['method'] = 'unknown'
>           except FileNotFoundError:
> -            raise
> -        os.chdir(current_dir)
> -        sys.path.remove(self.tmp_extract)
> +            self.build_backend = 'setuptools.build_meta'
> +            self.setup_metadata = {'method': 'setuptools'}
> +        finally:
> +            os.chdir(current_dir)
>
>       def get_requirements(self, pkg_folder):
>           """
> @@ -406,7 +436,11 @@ class BuildrootPackage():
>           if 'install_requires' not in self.setup_metadata:
>               self.pkg_req = None
>               return set()
> -        self.pkg_req = self.setup_metadata['install_requires']
> +        self.pkg_req = set()
> +        extra_re = re.compile(r'''extra\s*==\s*("([^"]+)"|'([^']+)')''')
> +        for req in self.setup_metadata['install_requires']:
> +            if not extra_re.search(req):
> +                self.pkg_req.add(req)
>           self.pkg_req = [re.sub(r'([-.\w]+).*', r'\1', req)
>                           for req in self.pkg_req]
>
> @@ -753,11 +787,6 @@ def main():
>                   package.fetch_package_info()
>               except (six.moves.urllib.error.URLError, six.moves.urllib.error.HTTPError):
>                   continue
> -            if package.metadata_name.lower() == 'setuptools':
> -                # setuptools imports itself, that does not work very well
> -                # with the monkey path at the beginning
> -                print('Error: setuptools cannot be built using scanPyPI')
> -                continue
>
>               try:
>                   package.download_package()
> @@ -777,17 +806,15 @@ def main():
>                   continue
>
>               # Loading the package install info from the package
> +            package.load_pyproject()
>               try:
> -                package.load_setup()
> +                package.load_metadata()
>               except ImportError as err:
>                   if 'buildutils' in str(err):
>                       print('This package needs buildutils')
>                       continue
>                   else:
> -                    try:
> -                        package.load_pyproject()
> -                    except Exception:
> -                        raise
> +                    raise
>               except (AttributeError, KeyError) as error:
>                   print('Error: Could not install package {pkg}: {error}'.format(
>                       pkg=package.real_name, error=error))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
