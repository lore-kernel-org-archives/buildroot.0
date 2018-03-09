From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Mar 2018 20:16:51 +0100
Subject: [Buildroot] [PATCH 00/10] Add docker-compose
Message-ID: <20180309191701.23760-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Docker-compose is a python based multi-container orchestration system
for Docker. Add a number of python modules needed by it and finally
docker-compose itself.

While docker-compose uses the python-package infrastructure, the
package is NOT named python-docker-compose and listed together with
the other external python modules because the package is normally used
through the docker-compose tool instead of E.G. using it as a library
in python.

Instead it is simply named docker-compose and listed together with the
other docker packages for discoverability.

Docker-compose may interact with a locally installed docker-engine or
an engine running on a remote host, so no dependencies to
docker-engine has been added.

Peter Korsgaard (10):
  package: add python-docker-pycreds
  package: add python-websocket-client
  package: add python-backports-ssl-match-hostname
  package: add python-docker
  package: add python-cached-property
  package: add python-texttable
  package: add python-dockerpty
  package: add python-functools32
  python-jsonschema: needs python-functools32 when used with python 2.7
  package: add docker-compose

 DEVELOPERS                                         |  9 ++++
 package/Config.in                                  |  9 ++++
 package/docker-compose/Config.in                   | 29 +++++++++++++
 package/docker-compose/docker-compose.hash         |  4 ++
 package/docker-compose/docker-compose.mk           | 13 ++++++
 .../python-backports-ssl-match-hostname/Config.in  |  7 ++++
 .../python-backports-ssl-match-hostname.hash       |  4 ++
 .../python-backports-ssl-match-hostname.mk         | 14 +++++++
 package/python-cached-property/Config.in           |  6 +++
 .../python-cached-property.hash                    |  4 ++
 .../python-cached-property.mk                      | 14 +++++++
 package/python-docker-pycreds/Config.in            |  7 ++++
 .../python-docker-pycreds.hash                     |  4 ++
 .../python-docker-pycreds/python-docker-pycreds.mk | 14 +++++++
 .../0001-setup.py-make-pip-optional.patch          | 49 ++++++++++++++++++++++
 package/python-docker/Config.in                    | 15 +++++++
 package/python-docker/python-docker.hash           |  4 ++
 package/python-docker/python-docker.mk             | 14 +++++++
 package/python-dockerpty/Config.in                 |  7 ++++
 package/python-dockerpty/python-dockerpty.hash     |  4 ++
 package/python-dockerpty/python-dockerpty.mk       | 14 +++++++
 package/python-functools32/Config.in               |  8 ++++
 package/python-functools32/python-functools32.hash |  4 ++
 package/python-functools32/python-functools32.mk   | 14 +++++++
 package/python-jsonschema/Config.in                |  1 +
 package/python-texttable/Config.in                 |  6 +++
 package/python-texttable/python-texttable.hash     |  4 ++
 package/python-texttable/python-texttable.mk       | 14 +++++++
 package/python-websocket-client/Config.in          |  9 ++++
 .../python-websocket-client.hash                   |  4 ++
 .../python-websocket-client.mk                     | 14 +++++++
 31 files changed, 323 insertions(+)
 create mode 100644 package/docker-compose/Config.in
 create mode 100644 package/docker-compose/docker-compose.hash
 create mode 100644 package/docker-compose/docker-compose.mk
 create mode 100644 package/python-backports-ssl-match-hostname/Config.in
 create mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
 create mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
 create mode 100644 package/python-cached-property/Config.in
 create mode 100644 package/python-cached-property/python-cached-property.hash
 create mode 100644 package/python-cached-property/python-cached-property.mk
 create mode 100644 package/python-docker-pycreds/Config.in
 create mode 100644 package/python-docker-pycreds/python-docker-pycreds.hash
 create mode 100644 package/python-docker-pycreds/python-docker-pycreds.mk
 create mode 100644 package/python-docker/0001-setup.py-make-pip-optional.patch
 create mode 100644 package/python-docker/Config.in
 create mode 100644 package/python-docker/python-docker.hash
 create mode 100644 package/python-docker/python-docker.mk
 create mode 100644 package/python-dockerpty/Config.in
 create mode 100644 package/python-dockerpty/python-dockerpty.hash
 create mode 100644 package/python-dockerpty/python-dockerpty.mk
 create mode 100644 package/python-functools32/Config.in
 create mode 100644 package/python-functools32/python-functools32.hash
 create mode 100644 package/python-functools32/python-functools32.mk
 create mode 100644 package/python-texttable/Config.in
 create mode 100644 package/python-texttable/python-texttable.hash
 create mode 100644 package/python-texttable/python-texttable.mk
 create mode 100644 package/python-websocket-client/Config.in
 create mode 100644 package/python-websocket-client/python-websocket-client.hash
 create mode 100644 package/python-websocket-client/python-websocket-client.mk

-- 
2.11.0
