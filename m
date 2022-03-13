Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61151C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 16:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1F64408C2;
	Sun, 13 Mar 2022 16:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWIC__UERfqr; Sun, 13 Mar 2022 16:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB0954089B;
	Sun, 13 Mar 2022 16:31:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 204D31BF300
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 16:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1533560B1E
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 16:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5eCtSaJu8fe6 for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 16:31:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFD9C60AC3
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 16:31:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91a3:d0c0:1a06:f60f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 671497802BE;
 Sun, 13 Mar 2022 17:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647189113;
 bh=kE7RfF2NvKunE6hyPl+gwFCBVijEXHjvP5jtVHDs36s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F+qHUn7ngu9061om3l4Fgdm47c2DHH5puXoaRN/xqyC+lpZ51VZSL/1mumK+JXHOR
 VApcmFveSpeVrQ5Ft+XsRT9Ss6qOKWWpuzye+zKeozA1msVpKjP76umCiMEAqyLxoo
 3pwr/t6Zph3SPmqJ+kqyKI1PGGLTczUJDqfy9kvBB1/pYpR3VoWvmVCowIX1cbPHKc
 MWZ648AaDx+ublR77pU9DXGudty/dcpPNMRJ87Uhlqd6ngBf/slVoCU6YM11QjQOjG
 WVXmbrK7D8+imAiFSSReeEaM5FZSVMuQgnzTulo9t22ZAEiCNqCok1Jdk7gvRTxdPy
 tp04vOx8zc+Hg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Mar 2022 17:31:51 +0100
Date: Sun, 13 Mar 2022 17:31:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220313163151.GU283544@scaer>
References: <20220313143726.267306-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220313143726.267306-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: add flit package support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-03-13 08:37 -0600, James Hilliard spake thusly:
> These packages don't have a setup.py so we instead need to parse their
> pyproject.toml file.

Please, split this into at least two patches;

  - offload the loading to a separate function (i.e. load_pyproject())
  - introduce support for flit packages

Also, even though I did not look at the code too closely, it looks like
the handling of the homepage is not strictly tied to the flit support,
so perhaps it should be also separated (unless it is tied to the
introduction of load_pyproject()?)

Anyway, separate patches into semantically contained minimalist patches,
please.

Alos, please try to provide more detailed explanations in your commit
logs. Consider that reviewers are dumb in your area of expertise (I
certainly am!), and consider what information we will need to understand
the change, and also what we will need in two weeks, two months, two
years when we have an issue and we want to understand how the code came
to be...

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  utils/scanpypi | 126 ++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 105 insertions(+), 21 deletions(-)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 17d8a0017a..98426820c6 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -42,6 +42,48 @@ except ImportError:
>            'pip install spdx_lookup')
>      liclookup = None
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
> +
>  
>  def setup_decorator(func, method):
>      """
> @@ -296,20 +338,52 @@ class BuildrootPackage():
>          current_dir = os.getcwd()
>          os.chdir(self.tmp_extract)
>          sys.path.insert(0, self.tmp_extract)
> -        s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
> -        imp.load_module('__main__', s_file, s_path, s_desc)
> -        if self.metadata_name in self.setup_args:
> -            pass
> -        elif self.metadata_name.replace('_', '-') in self.setup_args:
> -            self.metadata_name = self.metadata_name.replace('_', '-')
> -        elif self.metadata_name.replace('-', '_') in self.setup_args:
> -            self.metadata_name = self.metadata_name.replace('-', '_')
>          try:
> -            self.setup_metadata = self.setup_args[self.metadata_name]
> -        except KeyError:
> -            # This means setup was not called
> -            print('ERROR: Could not determine package metadata for {pkg}.\n'
> -                  .format(pkg=self.real_name))
> +            s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
> +            imp.load_module('__main__', s_file, s_path, s_desc)
> +            if self.metadata_name in self.setup_args:
> +                pass
> +            elif self.metadata_name.replace('_', '-') in self.setup_args:
> +                self.metadata_name = self.metadata_name.replace('_', '-')
> +            elif self.metadata_name.replace('-', '_') in self.setup_args:
> +                self.metadata_name = self.metadata_name.replace('-', '_')
> +            try:
> +                self.setup_metadata = self.setup_args[self.metadata_name]
> +            except KeyError:
> +                # This means setup was not called
> +                print('ERROR: Could not determine package metadata for {pkg}.\n'
> +                      .format(pkg=self.real_name))
> +                raise
> +        finally:
> +            os.chdir(current_dir)
> +            sys.path.remove(self.tmp_extract)
> +
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
> +                    self.setup_metadata['method'] = 'flit'
> +                elif build_system.get('backend-path', None) is not None:
> +                    self.setup_metadata['method'] = 'pep517'
> +                else:
> +                    self.setup_metadata['method'] = 'unknown'
> +            except KeyError:
> +                # This means setup was not called
> +                print('ERROR: Could not determine package metadata for {pkg}.\n'
> +                      .format(pkg=self.real_name))
> +                raise
> +        except FileNotFoundError:
>              raise
>          os.chdir(current_dir)
>          sys.path.remove(self.tmp_extract)
> @@ -609,7 +683,8 @@ class BuildrootPackage():
>  
>          lines.append('\thelp\n')
>  
> -        help_lines = textwrap.wrap(self.metadata['info']['summary'], 62,
> +        md_info = self.metadata['info']
> +        help_lines = textwrap.wrap(md_info['summary'], 62,
>                                     initial_indent='\t  ',
>                                     subsequent_indent='\t  ')
>  
> @@ -617,11 +692,17 @@ class BuildrootPackage():
>          if help_lines[-1][-1] != '.':
>              help_lines[-1] += '.'
>  
> -        # \t + two spaces is 3 char long
> -        help_lines.append('')
> -        help_lines.append('\t  ' + self.metadata['info']['home_page'])
> -        help_lines = [x + '\n' for x in help_lines]
> -        lines += help_lines
> +        home_page = md_info.get('home_page', None)
> +        if home_page is None or len(home_page) == 0:
> +            project_urls = md_info.get('project_urls', {})
> +            home_page = project_urls.get('Homepage', None)
> +
> +        if home_page is not None and len(home_page) != 0:
> +            # \t + two spaces is 3 char long
> +            help_lines.append('')
> +            help_lines.append('\t  ' + home_page)
> +            help_lines = [x + '\n' for x in help_lines]
> +            lines += help_lines
>  
>          with open(path_to_config, 'w') as config_file:
>              config_file.writelines(lines)
> @@ -692,9 +773,12 @@ def main():
>              except ImportError as err:
>                  if 'buildutils' in str(err):
>                      print('This package needs buildutils')
> +                    continue
>                  else:
> -                    raise
> -                continue
> +                    try:
> +                        package.load_pyproject()
> +                    except Exception as e:
> +                        raise
>              except (AttributeError, KeyError) as error:
>                  print('Error: Could not install package {pkg}: {error}'.format(
>                      pkg=package.real_name, error=error))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
