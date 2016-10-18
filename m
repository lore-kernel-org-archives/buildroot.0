From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 13:58:25 +0200
Subject: [Buildroot] [PATCH v2] support/misc/Vagrantfile: bump to ubuntu
 16.04
In-Reply-To: <1476741182-23366-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1476741182-23366-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <a573224b-5e31-cad6-be0b-fe816adbaac8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-16 23:53, Angelo Compagnucci wrote:
> * Updating to ubuntu 16.04
> * Fixing dependencies
> * Fixing locale complaints
> * Removing unused packages
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
> Changelog
> 
> * Changed to C locale as suggested by Arnout Vandecappelle
> 
>  support/misc/Vagrantfile | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
> index cf269fe..5e56d5d 100644
> --- a/support/misc/Vagrantfile
> +++ b/support/misc/Vagrantfile
> @@ -12,7 +12,7 @@ VM_MEMORY=2048
>  VM_CORES=1
>  
>  Vagrant.configure('2') do |config|
> -	config.vm.box = 'ubuntu/trusty64'
> +	config.vm.box = 'bento/ubuntu-16.04'
>  
>  	config.vm.provider :vmware_fusion do |v, override|
>  		v.vmx['memsize'] = VM_MEMORY
> @@ -44,10 +44,13 @@ Vagrant.configure('2') do |config|
>  	config.vm.provision 'shell', inline:
>  		"sudo dpkg --add-architecture i386
>  		sudo apt-get -q update
> +		sudo apt-get purge -q -y snapd lxcfs lxd ubuntu-core-launcher snap-confine
> +		sudo apt-get -q -y upgrade
>  		sudo apt-get -q -y install build-essential libncurses5-dev \
> -			git bzr cvs mercurial subversion libc6:i386 unzip
> +			git bzr cvs mercurial subversion libc6:i386 unzip bc
>  		sudo apt-get -q -y autoremove
> -		sudo apt-get -q -y clean"
> +		sudo apt-get -q -y clean
> +		sudo update-locale LC_ALL=C"
>  
>  	config.vm.provision 'shell', privileged: false, inline:
>  		"echo 'Downloading and extracting buildroot #{RELEASE}'
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
