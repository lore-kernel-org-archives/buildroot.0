From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 22:21:37 +0200
Subject: [Buildroot] [PATCH 1/1] Add libvirt (KVM) support
In-Reply-To: <20190215173607.13773-1-christopher@lecroq.be>
References: <20190215173607.13773-1-christopher@lecroq.be>
Message-ID: <20190413222137.6c0cba37@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christopher,

Sorry for the very long delay in replying. I am not an expert with the
Vagrant stuff, so I'm adding Angelo in Cc who hopefully will be able to
comment further. Still, I have a few comments.

First, the commit title should be:

	support/misc/Vagrantfile: add libvirt/kvm support

On Fri, 15 Feb 2019 18:36:07 +0100
Christopher Peeters <christopher@lecroq.be> wrote:

> Signed-off-by: Christopher Peeters <christopher@lecroq.be>
> ---
>  support/misc/Vagrantfile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
> index 1ca5edc647..48f01a5807 100644
> --- a/support/misc/Vagrantfile
> +++ b/support/misc/Vagrantfile
> @@ -29,6 +29,12 @@ Vagrant.configure('2') do |config|
>  		end
>  	end
>  
> +  config.vm.provider :libvirt do |v, override|
> +    override.vm.box = 'generic/ubuntu1804'

Why are you overriding the distribution being used? It seems odd that
depending on the virtualization technology, a different distribution
gets installed inside the VM.

> +    v.memory = VM_MEMORY
> +    v.cpus = VM_CORES
> +  end 

The indentation is also bogus: the file uses tabs, and you used two
spaces. Could you fix that up ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
