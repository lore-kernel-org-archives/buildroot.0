From: Robin Jarry <robin.jarry@6wind.com>
Date: Thu, 10 Sep 2020 09:53:28 +0200
Subject: [Buildroot] [PATCH v3 1/2] support/scripts/pycompile: fix .pyc
 original source file paths
In-Reply-To: <20200910074547.2983-2-robin.jarry@6wind.com>
References: <20200904112908.21686-1-julien.floret@6wind.com>
 <20200910074547.2983-1-robin.jarry@6wind.com>
 <20200910074547.2983-2-robin.jarry@6wind.com>
Message-ID: <20200910075328.hhb2ppaefkpmag6l@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2020-09-10, Robin Jarry:
> +    if not force:
> +        # inspired from compileall.compile_file in the standard library
> +        try:
> +            with open(host_path + "c", "rb") as f:
> +                header = f.read(12)
> +            expect = struct.pack("<4sll", importlib.util.MAGIC_NUMBER,
> +                                 0, int(os.stat(host_path).st_mtime))
> +            if header == expect:
> +                return  # .pyc file already up to date.
> +        except OSError:
> +            pass  # .pyc file does not exist

This bit does not work with python 2. I'll submit a fix in a v4.

Sorry about the noise...

-- 
Robin
