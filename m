Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BB5C25B0E
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 00:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 578624035C;
	Wed, 17 Aug 2022 00:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 578624035C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgwlIwmhwR2y; Wed, 17 Aug 2022 00:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05E00403C7;
	Wed, 17 Aug 2022 00:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05E00403C7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB7681BF215
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 00:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94DD640384
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 00:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94DD640384
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZXN9XW8i63Oz for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 00:48:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD6224035C
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD6224035C
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 00:48:17 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4M6qBK266Sz9sTG;
 Wed, 17 Aug 2022 02:48:09 +0200 (CEST)
Message-ID: <d907e04c-19f2-e313-078a-149e122a0011@othermo.de>
Date: Wed, 17 Aug 2022 02:48:08 +0200
MIME-Version: 1.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220313171355.271345-1-james.hilliard1@gmail.com>
 <20220313171355.271345-2-james.hilliard1@gmail.com>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20220313171355.271345-2-james.hilliard1@gmail.com>
X-Rspamd-Queue-Id: 4M6qBK266Sz9sTG
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1660697289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ck1TLDEWnBB4IWVB8vBEgK1JmLXW+EdEb6u5u+Js29M=;
 b=Jhi2zQEhc7Br9S6hX8Q6XsbkAt/Xh+Wia28FIW6ht8wckCfaTcSRwgv1eiVl0N5GREOj1u
 vVPkazyt5J90g9N9W1YRU5Ee3ralFbOE89F3hASE1S/Ufk1CNHuWFU6UEde85JIhZhR1kx
 XS/h+HdGbloXsZE9BX8hWfjnFh777yFPd0w1ODlnGuftLODFcCKt1pTA9sMbca5NNbNxKM
 WcwNyxpnFDUUb+eKbTtZeg1XeaauXian8jPCHUmnoASgxelFUCxFo/olEjdu6CnsFNGs2S
 YC/A1uPutNMwYh9YzrxKPersjQz5h0v7mghFn0OMyvwinro+o4aADUCJwBrq9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=Jhi2zQEh
Subject: Re: [Buildroot] [PATCH v2 2/2] utils/scanpypi: add flit package
 support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

I needed to package quite a lot of python dependencies, so I tried out 
this patch. There's a number of things missing still here, plus I ended 
up being a bit confused with the pep517 vs flit setup types... maybe you 
could help clarifying this?


On 13.03.22 18:13, James Hilliard wrote:
> These packages don't have a setup.py so we instead need to parse their
> pyproject.toml file.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>    - remove homepage format fixes(sent as separate patch)
>    - remove load_setup fixes
>    - move load_pyproject cleanup to finally block
> ---
>   utils/scanpypi | 80 ++++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 78 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 724e59f759..f501b36232 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -42,6 +42,48 @@ except ImportError:
>             'pip install spdx_lookup')
>       liclookup = None
>   
> +def toml_load(f):
> +    with open(f, 'rb') as fh:
> +        ex = None
> +
> +        # Try regular tomli first
> +        try:
> +            from tomli import load
> +            return load(fh)
> +        except ImportError as e:
> +            ex = e
> +
> +        # Try pip's vendored tomli
> +        try:
> +            from pip._vendor.tomli import load
> +            try:
> +                return load(fh)
> +            except TypeError:
> +                # Fallback to handle older version
> +                try:
> +                    fh.seek(0)
> +                    w = io.TextIOWrapper(fh, encoding="utf8", newline="")
> +                    return load(w)
> +                finally:
> +                    w.detach()
> +        except ImportError as e:
> +            pass
> +
> +        # Try regular toml last
> +        try:
> +            from toml import load
> +            fh.seek(0)
> +            w = io.TextIOWrapper(fh, encoding="utf8", newline="")
> +            try:
> +                return load(w)
> +            finally:
> +                w.detach()
> +        except ImportError:
> +            pass
> +
> +        print('This package needs tomli')
> +        raise ex

Couldn't we just try to use tomli or error out with this message and be 
done with it? Surely users of this script would know how to get tomli 
for their python install?

(For what it's worth python 3.11 will ship with a copy of tomli under 
the tomllib module, so we could probably try using that and otherwise 
fall back to requiring tomli)

> +
>   
>   def setup_decorator(func, method):
>       """
> @@ -316,6 +358,37 @@ class BuildrootPackage():
>               os.chdir(current_dir)
>               sys.path.remove(self.tmp_extract)
>   
> +    def load_pyproject(self):
> +        """
> +        Loads the corresponding pyproject.toml and store its metadata
> +        """
> +        current_dir = os.getcwd()
> +        os.chdir(self.tmp_extract)
> +        sys.path.insert(0, self.tmp_extract)
> +        try:
> +            pyproject_data = toml_load('pyproject.toml')
> +            try:
> +                self.setup_metadata = pyproject_data.get('project', {})
> +                self.metadata_name = self.setup_metadata.get('name', self.real_name)
> +                build_system = pyproject_data.get('build-system', {})
> +                build_backend = build_system.get('build-backend', None)
> +                if build_backend is not None and build_backend == 'flit_core.buildapi':

This doesn't catch the very common case of having a pyproject.toml which 
requests the setuptools build backend via build-backend = 
"setuptools.build_meta"

These projects could alternatively be built via the setuptools frontend 
iff they ship with a (stub) setup.py file but it seems better to just 
build them via pep517 anyway, right?

Mh, why do we even have flit and pep517 build systems as separate 
options? flit is (at least nowadays) only a pep517 backend (plus a 
frontend which we don't use, I think). (I tried making sense of 
package/pkg-python.mk but I couldn't really see the differerence between 
the pep517 and flit methods)

So shouldn't anything that has a pyproject.toml with a [build-system] 
section be pep517?

> +                    self.setup_metadata['method'] = 'flit'
> +                elif build_system.get('backend-path', None) is not None:
> +                    self.setup_metadata['method'] = 'pep517' > +                else:
> +                    self.setup_metadata['method'] = 'unknown'

We are still missing reading out the dependencies for the pyproject.toml 
case, right? Dependencies are currently expected to be in the 
"install_requires" key in the metadata, but in the new world they are 
under 'dependencies'. Easiest would be copying them over right here. The 
format of those dependency specifications seems to be the same. (There's 
also the old-style flit metadata[1] that i.e. fastapi[2] uses for 
dependency specifications, but I don't think that's worth supporting; We 
also don't handle requirements.txt or setup.cfg *shrug*)

> +            except KeyError:
> +                # This means setup was not called

This comment is wrong here, I believe.

> +                print('ERROR: Could not determine package metadata for {pkg}.\n'
> +                      .format(pkg=self.real_name))
> +                raise
> +        except FileNotFoundError:
> +            raise
> +        finally:
> +            os.chdir(current_dir)
> +            sys.path.remove(self.tmp_extract)
> +
>       def get_requirements(self, pkg_folder):
>           """
>           Retrieve dependencies from the metadata found in the setup.py script of
> @@ -694,9 +767,12 @@ def main():
>               except ImportError as err:
>                   if 'buildutils' in str(err):
>                       print('This package needs buildutils')
> +                    continue
>                   else:
> -                    raise
> -                continue
> +                    try:
> +                        package.load_pyproject()
> +                    except Exception as e:
> +                        raise
>               except (AttributeError, KeyError) as error:
>                   print('Error: Could not install package {pkg}: {error}'.format(
>                       pkg=package.real_name, error=error))

One other thing we'd need to handle here is packages which now ship with 
just a stub setup.py file, i.e. [3]. Those will trigger one 
AttributeError, KeyError and we should in that case just continue on 
with parsing the pyproject.toml.


[1]: https://flit.pypa.io/en/latest/pyproject_toml.html#old-style-metadata
[2]: https://github.com/tiangolo/fastapi/blob/0.79.0/pyproject.toml
[3]: https://github.com/Pylons/waitress/blob/v2.1.2/setup.py
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
